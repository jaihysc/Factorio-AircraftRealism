--Handles the takeoff and landing of the plane
local recognisedPlanes = require("definitions.recognisedPlanes")
local utils = require("logic.utility")

local function insertItems(inventory, items)
    for name,count in pairs(items) do
        inventory.insert({name=name, count=count})
    end
end

--Plane takeoff landing transition
--Seemlessly shifts from one plane to another without the player noticing
local function transitionPlane(oldPlane, newPlane, game, defines, takingOff)
    newPlane.copy_settings(oldPlane)

    --Set Fuel bar
    newPlane.burner.currently_burning = oldPlane.burner.currently_burning
    newPlane.burner.remaining_burning_fuel = oldPlane.burner.remaining_burning_fuel

    --Set fuel inventory
    insertItems(newPlane.get_fuel_inventory(), oldPlane.get_fuel_inventory().get_contents())

    --Set item inventory
    insertItems(newPlane.get_inventory(defines.inventory.car_trunk), oldPlane.get_inventory(defines.inventory.car_trunk).get_contents())

    --Set weapon item inventory
    insertItems(newPlane.get_inventory(defines.inventory.car_ammo), oldPlane.get_inventory(defines.inventory.car_ammo).get_contents())

    --Select the last weapon
    if oldPlane.selected_gun_index and newPlane.prototype.guns then
        --Validate that the 2 planes both have the same weapons
        if utils.getTableLength(newPlane.prototype.guns) > newPlane.selected_gun_index then
            newPlane.selected_gun_index = oldPlane.selected_gun_index
        end
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

local function planeTakeoff(player, game, defines, settings)
    --if player is grounded and plane is greater than the specified takeoff speed
    for i,plane in pairs(recognisedPlanes) do
        if player.vehicle.name == plane and player.vehicle.speed > utils.toFactorioUnit(settings, settings.global["aircraft-takeoff-speed-" .. plane].value) then
            transitionPlane(
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

local function planeLand(player, game, defines, settings)
    --if player is airborne and plane is less than the specified landing speed
    for i,plane in pairs(recognisedPlanes) do
        if player.vehicle.name == (plane .. "-airborne") and player.vehicle.speed < utils.toFactorioUnit(settings, settings.global["aircraft-landing-speed-" .. plane].value) then
            transitionPlane(
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

--Makes these functions available to the lua script which requires this file
local functions = {}

functions.planeTakeoff = planeTakeoff
functions.planeLand = planeLand


return functions