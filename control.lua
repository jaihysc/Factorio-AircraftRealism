local recognisedPlanes = { --!!Add more planes here as needed with new mods!!
    "gunship",
    "cargo-plane",
    "jet",
    "flying-fortress",
    "better-cargo-plane",
    "even-better-cargo-plane"
}

function OnTick(e)
    for index,player in pairs(game.connected_players) do  --loop through all online players on the server

        --if they are in a plane
        if player.character and player.driving then

            local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

            if quarterSecond then
                CheckHelicopterMod(player)
            end

            if IsGroundedPlane(player.vehicle.name) then
                --These don't need to be checked as often, so they run off quarterSecond
                if quarterSecond then
                    CreatePollution(player.surface, player.vehicle)
                    --Create some smoke effects trailing behind the plane
                    player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}

                    PlaneTakeoff(player, game, defines, settings)
                end

                --Collision gets checked every tick for accuracy
                if ValidateRunwayTile(player.surface, player.vehicle) then --Returns false if the plane did not pass and was destroyed
                    --Test for obstacle collision (water, cliff)
                    ObstacleCollision(game.surfaces[1], player, player.vehicle)
                end

            elseif quarterSecond and IsAirbornePlane(player.vehicle.name) then
                CreatePollution(player.surface, player.vehicle)

                PlaneLand(player, game, defines, settings)
            end
        end
    end
end


--If a player bails out of a speeding plane, destroy it if there is no passenger
--I would perfer to have the plane glide away, but there is no easy way that I know of to track them and all the solutions
--would likely lag if there is a large amount of planes
function OnPlayerDrivingChangedState(e)
    local player = game.get_player(e.player_index)

    if not player.driving and e.entity and IsAirbornePlane(e.entity.name) then

        --If there is a passenger in the plane, they become the pilot
        local passenger = e.entity.get_passenger()
        if passenger then
            e.entity.set_driver(passenger)
        else
            e.entity.die()
        end
    end
end

--Special function for the helicopter mod
function CheckHelicopterMod(player)
    if player.vehicle.name == "heli-entity-_-" then
        CreatePollution(player.surface, player.vehicle)
    end
end

--Test for plane type for plane name in the array of recognisedPlanes
function IsGroundedPlane(name)
    for i,plane in pairs(recognisedPlanes) do
        if name == plane then
            return true
        end
    end

    return false
end

function IsAirbornePlane(name)
    for i,plane in pairs(recognisedPlanes) do
        if name == (plane .. "-airborne") then
            return true
        end
    end

    return false
end

function ToFactorioUnit(kmH)
    if settings.global["aircraft-speed-unit"].value == "imperial" then
        kmH = kmH * 1.609 --Thanks google!
    end

    --Convert the lua speed into km/h with * 60 * 3.6
    return kmH / 216
end

function CreatePollution(surface, plane)
    if settings.global["aircraft-emit-pollution"].value then

        --More pollution is emitted at higher speeds, also depending on the fuel
        local emissions = settings.global["aircraft-pollution-amount"].value
        if plane.burner.currently_burning then
            emissions = emissions * plane.burner.currently_burning.fuel_emissions_multiplier
        end

        surface.pollute(plane.position, emissions * math.abs(plane.speed))
    end
end

--Runway tile material checker
function ValidateRunwayTile(surface, plane)
    local tile = surface.get_tile(plane.position)
    -- player.print(tile.name .. " | " ..tile.prototype.vehicle_friction_modifier) --For debug testing different surfaces

    --If strict runways are set, limit the plane's speed when not on runway material, dealing damage if landing on it
    if settings.global["aircraft-realism-strict-runway-checking"].value then

        --Cap the max speed to the max taxi speed when not on a runway
        if tile.prototype.vehicle_friction_modifier > settings.global["aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction"].value then

            --Take off 10% of speed and damage the plane if past the max taxi speed by 2x
            if plane.speed > ToFactorioUnit(settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) or plane.speed < -1 * ToFactorioUnit(settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) then
                if plane.speed > 0 then
                    plane.speed = plane.speed - 0.00925 --decrease speed by 2km/h per tick
                elseif plane.speed < 0 then
                    plane.speed = plane.speed + 0.00925
                end

                --damage the plane if past the max taxi speed, this should only apply on landing, I added a margin of 20km/h so one should not be able to accelerate faster than it unless in jet or has afterburners
                if plane.speed > ToFactorioUnit(settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) + 0.09259 or plane.speed < -1 * ToFactorioUnit(settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) - 0.009259  then
                    plane.health = plane.health - 1

                    if plane.health <= 0 then
                        plane.die()
                        return false --false to indicate plane is already destroyed
                    end
                end
            end
        end
    end

    return true
end

function PlaneTakeoff(player, game, defines, settings)
    --if player is grounded and plane is greater than the specified takeoff speed
    for i,plane in pairs(recognisedPlanes) do
        if player.vehicle.name == plane and player.vehicle.speed > ToFactorioUnit(settings.global["aircraft-takeoff-speed-" .. plane].value) then
            TransitionPlane(
                player.vehicle,
                player.surface.create_entity{name=player.vehicle.name .. "-airborne", position=player.position, force=game.forces.player},
                game,
                defines,
                true
            )

            --Create some smoke to indicate to the player they have taken off
            for i = 1, 3, 1 do
                player.surface.create_trivial_smoke{name="smoke", position=player.position, force="neutral"}
            end

            --Accelerate the new plane that the player is in so they don't need to press w again
            player.riding_state = {acceleration=defines.riding.acceleration.accelerating, direction=defines.riding.direction.straight}
            return
        end
    end
end

function PlaneLand(player, game, defines, settings)
    --if player is airborne and plane is less than the specified landing speed
    for i,plane in pairs(recognisedPlanes) do
        if player.vehicle.name == (plane .. "-airborne") and player.vehicle.speed < ToFactorioUnit(settings.global["aircraft-landing-speed-" .. plane].value) then
            TransitionPlane(
                player.vehicle,
                player.surface.create_entity{name=string.sub(player.vehicle.name, 0, string.len(player.vehicle.name) - string.len("-airborne")), position=player.position, force=game.forces.player},
                game,
                defines,
                false
            )

            --Create some smoke to indicate to the player they have landed
            for i = 1, 5, 1 do
                player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}
            end

            --Auto brake
            player.riding_state = {acceleration=defines.riding.acceleration.braking, direction=defines.riding.direction.straight}
            return
        end
    end
end

--Plane takeoff landing transition
--Seemlessly shifts from one plane to another without the player noticing
function TransitionPlane(oldPlane, newPlane, game, defines, takingOff)
    newPlane.copy_settings(oldPlane)

    --Set Fuel bar
    newPlane.burner.currently_burning = oldPlane.burner.currently_burning
    newPlane.burner.remaining_burning_fuel = oldPlane.burner.remaining_burning_fuel

    --Set fuel inventory
    InsertItems(newPlane.get_fuel_inventory(), oldPlane.get_fuel_inventory().get_contents())

    --Set item inventory
    InsertItems(newPlane.get_inventory(defines.inventory.car_trunk), oldPlane.get_inventory(defines.inventory.car_trunk).get_contents())

    --Set weapon item inventory
    InsertItems(newPlane.get_inventory(defines.inventory.car_ammo), oldPlane.get_inventory(defines.inventory.car_ammo).get_contents())

    --Select the last weapon
    if oldPlane.selected_gun_index then
        newPlane.selected_gun_index = oldPlane.selected_gun_index
    end

    --Transfer over equipment grid
    if oldPlane.grid then
        for index,item in pairs(oldPlane.grid.equipment) do
            local addedEquipment = newPlane.grid.put{name=item.name, position=item.position}
            --Transfer over charge and shield capacity
            if item.energy ~= 0 then addedEquipment.energy = item.energy end
            if item.shield ~= 0 then addedEquipment.shield = item.shield end
        end
    end

    --Health (Grounded planes have 5x less health)
    --Test if planes have the different max healths, to perform health scaling
    if game.entity_prototypes[newPlane.name].max_health ~= game.entity_prototypes[oldPlane.name].max_health then
        if takingOff then
            --airborne
            newPlane.health = oldPlane.health * 5
        else
            --Grounded
            newPlane.health = oldPlane.health / 5

        end
    else
        newPlane.health = oldPlane.health
    end

    --Physics
    newPlane.speed = oldPlane.speed
    newPlane.orientation = oldPlane.orientation

    --Destroy the old plane first before setting the passenger and driver to the new plane or else the game doesn't like it
    local driver = oldPlane.get_driver()
    local passenger = oldPlane.get_passenger()
    oldPlane.destroy()

    --Drivers / passengers
    newPlane.set_driver(driver)
    newPlane.set_passenger(passenger)
end

function InsertItems(inventory, items)
    for name,count in pairs(items) do
        inventory.insert({name=name, count=count})
    end
end

--Object, water Collisions
function ObstacleCollision(surface, player, plane)

    --Destroy the plane if the player LANDS ON a cliff
    for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()-0.4, name = {"cliff"}})) do
        if plane.speed == 0 then
            KillDriverAndPassenger(plane, player)

            return;
        end
    end
    --Destroy the plane upon landing in water
    local tile = surface.get_tile(plane.position).name
    if tile == "water" or tile == "water-shallow" or tile == "water-mud"or tile == "water-green" or tile == "deepwater" or tile == "deepwater-green" then
        if plane.speed == 0 then  --Player + passenger dies too since they will just be stuck anyways
            KillDriverAndPassenger(plane, player)

            return;
        end
    end

    if settings.global["aircraft-realism-environmental-impact"].value then
        for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()+2, name = {"cliff"}})) do
            --Over 40km/h
            if plane.speed > 0.185185 or plane.speed < -0.185185 then --destroy the plane upon hitting a cliff
                plane.die()

                return;
            end
        end
        for k, entity in pairs(surface.find_tiles_filtered({position = plane.position, radius = plane.get_radius()+2, name = {"water", "water-shallow", "water-mud", "water-green", "deepwater", "deepwater-green"}})) do
            if plane.speed > 0.185185 or plane.speed < -0.185185 then --upon hitting the shoreline
                plane.die()

                return;
            end
        end
    end
end

function KillDriverAndPassenger(plane, player)
    plane.get_driver().die(player.force, plane)
    local passenger = plane.get_passenger()
    if passenger then passenger.die(player.force, plane) end
    plane.die()
end

--Events
script.on_event(defines.events.on_tick, OnTick)
script.on_event(defines.events.on_player_driving_changed_state, OnPlayerDrivingChangedState)