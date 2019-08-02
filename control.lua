script.on_event({defines.events.on_tick}, function (e)
    if e.tick % 15 == 0 then --Check every quarter of a second
        for index,player in pairs(game.connected_players) do  --loop through all online players on the server

            --if they are in a plane
            if player.character and player.driving then

                --takeoff / landing | test for the 4 possible planes
                if IsGroundedPlane(player.vehicle.name) then
                    CreatePollution(player.surface, player.vehicle)

                    --Create some smoke effects trailing behind the plane
                    player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}

                    PlaneTakeoff(player, game, defines, settings)

                    --Test for obstacle collision (water, cliff)
                    ObstacleCollision(game.surfaces[1], player, player.vehicle)

                elseif IsAirbornePlane(player.vehicle.name) then
                    CreatePollution(player.surface, player.vehicle)

                    PlaneLand(player, game, defines, settings)
                end
            end
        end

        --todo
    end
end)

----------------------------------------------------If a player bails out of a speeding plane, destroy it since there is no pilot
--I would perfer to have the plane glide away, but there is no easy way that I know of to track them and all the solutions
--would likely lag if there is a large amount of planes

script.on_event({defines.events.on_player_driving_changed_state}, function (e)
   local player = game.get_player(e.player_index)

    if not player.driving and e.entity and IsAirbornePlane(e.entity.name) then
        e.entity.die()
        -- TransitionPlane(
        --     e.entity,
        --     e.entity.surface.create_entity{name=string.sub(e.entity.name, 0, string.len(e.entity.name) - string.len("-airborne")), position=e.entity.position, force="neutral"},
        --     game,
        --     defines,
        --     false
        -- )
    end
end)

----------------------------------------------------Get plane type

function IsGroundedPlane(name)
    if name == "gunship" or name == "cargo-plane" or name == "jet" or name == "flying-fortress" then
        return true
    else
        return false
    end
end

function IsAirbornePlane(name)
    if name == "gunship-airborne" or name == "cargo-plane-airborne" or name == "jet-airborne" or name == "flying-fortress-airborne" then
        return true
    else
        return false
    end
end

----------------------------------------------------Takeoff landing

function PlaneTakeoff(player, game, defines, settings)
    local takeoff = false

    if player.vehicle.name == "gunship" and player.vehicle.speed > ToFactorioUnit(settings.global["aircraft-takeoff-speed-dropship"].value) then takeoff = true end
    if player.vehicle.name == "cargo-plane" and player.vehicle.speed > ToFactorioUnit(settings.global["aircraft-takeoff-speed-cargo-plane"].value) then takeoff = true end
    if player.vehicle.name == "jet" and player.vehicle.speed > ToFactorioUnit(settings.global["aircraft-takeoff-speed-jet"].value) then takeoff = true end
    if player.vehicle.name == "flying-fortress" and player.vehicle.speed > ToFactorioUnit(settings.global["aircraft-takeoff-speed-flying-fortress"].value) then takeoff = true end

    if takeoff then
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
    end
end

function PlaneLand(player, game, defines, settings)
    local land = false

    --If less than the specified landing speed for the plane
    if player.vehicle.name == "gunship-airborne" and player.vehicle.speed < ToFactorioUnit(settings.global["aircraft-landing-speed-dropship"].value) then land = true end
    if player.vehicle.name == "cargo-plane-airborne" and player.vehicle.speed < ToFactorioUnit(settings.global["aircraft-landing-speed-cargo-plane"].value) then land = true end
    if player.vehicle.name == "jet-airborne" and player.vehicle.speed < ToFactorioUnit(settings.global["aircraft-landing-speed-jet"].value) then land = true end
    if player.vehicle.name == "flying-fortress-airborne" and player.vehicle.speed < ToFactorioUnit(settings.global["aircraft-landing-speed-flying-fortress"].value) then land = true end


    if land then
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

        player.riding_state = {acceleration=defines.riding.acceleration.braking, direction=defines.riding.direction.straight}
    end
end

----------------------------------------------------Plane takeoff landing transition

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

----------------------------------------------------Object, water Collisions
function ObstacleCollision(surface, player, plane)
    if settings.global["aircraft-realism-environmental-impact"].value then
        for k, entity in pairs (surface.find_entities_filtered({position = player.position, radius = plane.get_radius()+3, name = {"cliff"}})) do
            --Over 35km/h
            if plane.speed > 0.16203 or plane.speed > -0.16203 then --destroy the plane upon hitting a cliff
                plane.die()
            end
            return;
        end
    end

    --Destroy the plane if the player LANDS ON a cliff
    for k, entity in pairs (surface.find_entities_filtered({position = player.position, radius = plane.get_radius()+1, name = {"cliff"}})) do
        if plane.speed == 0 then
            plane.die()
        end
        return;
    end
    for k, entity in pairs (surface.find_tiles_filtered({position = player.position, radius = plane.get_radius()+2.5, name = {"water", "water-shallow", "water-mud", "water-green", "deepwater", "deepwater-green"}})) do
        if plane.speed == 0 then --destroy the plane upon landing in water
            plane.get_driver().die(player.force, plane) --Player dies too since they will just be stuck anyways
            local passenger = plane.get_passenger() --Player dies too since they will just be stuck anyways
            if passenger then passenger.die(player.force, plane) end
            plane.die()
        end
        return;
    end
end

----------------------------------------------------Aircraft pollution
function CreatePollution(surface, plane)
    if settings.global["aircraft-emit-pollution"].value then
        surface.pollute(plane.position, settings.global["aircraft-pollution-amount"].value * plane.speed) --More pollution is emitted at higher speeds
    end
end

----------------------------------------------------Measurement Conversions
function ToFactorioUnit(kmH)
    if settings.global["aircraft-speed-unit"].value == "imperial" then
        kmH = kmH * 1.609 --Thanks google!
    end

    --Convert the lua speed into km/h with * 60 * 3.6
    return kmH / 216
end
