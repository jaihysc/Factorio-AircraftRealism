-- Handles the takeoff and landing of the plane
local utility = require("logic.utility")

local function insertItems(oldInventory, newInventory)
    if oldInventory then
        assert(newInventory, "Old plane has inventory, new plane does not. Check plane prototypes")
        -- With this method, inventory items stay in the same place
        for i = 1, #oldInventory, 1 do
            if i <= #newInventory then
                newInventory[i].set_stack(oldInventory[i])
            end
        end
    end
end

-- Plane takeoff landing transition
-- Seemlessly shifts from one plane to another without the player noticing
local function transitionPlane(oldPlane, newPlane, game, defines, takingOff)
    newPlane.copy_settings(oldPlane)

    -- Set Fuel bar
    if oldPlane.burner then
        assert(newPlane.burner, "Old plane has burner, new plane does not. Check plane prototypes")
        newPlane.burner.currently_burning = oldPlane.burner.currently_burning
        newPlane.burner.remaining_burning_fuel = oldPlane.burner.remaining_burning_fuel
    end

    -- The inventories cannot differ, or else items disappear
    -- Set fuel inventory
    insertItems(oldPlane.get_fuel_inventory(), newPlane.get_fuel_inventory())

    -- Set item inventory
    insertItems(oldPlane.get_inventory(defines.inventory.car_trunk), newPlane.get_inventory(defines.inventory.car_trunk))

    -- Set weapon item inventory
    insertItems(oldPlane.get_inventory(defines.inventory.car_ammo), newPlane.get_inventory(defines.inventory.car_ammo))

    -- Select the last weapon
    if oldPlane.selected_gun_index then
        assert(utility.getTableLength(oldPlane.prototype.guns) == utility.getTableLength(newPlane.prototype.guns), "Old plane does not have same number of guns as new plane. Check plane prototypes")
        newPlane.selected_gun_index = oldPlane.selected_gun_index
    end

    -- Transfer over equipment grid
    if oldPlane.grid then
        assert(newPlane.grid, "Old plane has grid, new plane does not. Check plane prototypes")
        for index,item in pairs(oldPlane.grid.equipment) do
            local addedEquipment = newPlane.grid.put{name=item.name, position=item.position}
            assert(addedEquipment, "Could not insert old plane equipment into new plane. Check plane prototypes")

            -- Transfer over charge and shield capacity

            -- We MUST check for non zero, otherwise attempting to set for item which
            -- does not have energy or shield is an error
            if item.energy ~= 0 then addedEquipment.energy = item.energy end
            if item.shield ~= 0 then addedEquipment.shield = item.shield end

            if item.burner then
                assert(addedEquipment.burner, "Old plane equipment has burner, new plane equipment does not. Check plane prototypes")
                -- Transfer burner contents
                insertItems(item.burner.inventory, addedEquipment.burner.inventory)

                addedEquipment.burner.currently_burning = item.burner.currently_burning
                addedEquipment.burner.heat = item.burner.heat
                addedEquipment.burner.remaining_burning_fuel = item.burner.remaining_burning_fuel
            end
        end
    end

    -- Health (Grounded planes have 2x less health with realistic health option checked)
    -- Test if planes have the different max healths, to perform health scaling
    if game.entity_prototypes[newPlane.name].max_health ~= game.entity_prototypes[oldPlane.name].max_health then
        if takingOff then
            -- Airborne
            newPlane.health = oldPlane.health * 2
        else
            -- Grounded
            newPlane.health = oldPlane.health / 2

        end
    else
        newPlane.health = oldPlane.health
    end

    newPlane.destructible = oldPlane.destructible
    newPlane.operable = oldPlane.operable
    if oldPlane.relative_turret_orientation then
        assert(newPlane.relative_turret_orientation, "Old plane has relative_turret_orientation, new plane does not. Check plane prototypes")
        newPlane.relative_turret_orientation = oldPlane.relative_turret_orientation
    end
    newPlane.effectivity_modifier = oldPlane.effectivity_modifier
    newPlane.consumption_modifier = oldPlane.consumption_modifier
    newPlane.friction_modifier = oldPlane.friction_modifier
    newPlane.speed = oldPlane.speed
    newPlane.orientation = oldPlane.orientation

    -- Destroy the old plane first before setting the passenger and driver to the new plane or else the game doesn't like it
    local driver = oldPlane.get_driver()
    local passenger = oldPlane.get_passenger()
    oldPlane.destroy()

    -- Drivers / passengers
    newPlane.set_driver(driver)
    newPlane.set_passenger(passenger)
end

local function planeTakeoff(player, game, defines, settings)
    assert(player.vehicle)
    -- If player is grounded and plane is greater than the specified takeoff speed
    if utility.isGroundedPlane(player.vehicle.prototype.order) and
       player.vehicle.speed > utility.getTakeoffSpeed(player.vehicle.name) then
        local newPlane = player.surface.create_entity{
            name    =player.vehicle.name .. "-airborne",
            position=player.position,
            force   =player.force,
            create_build_effect_smoke=false
        }

        transitionPlane(
            player.vehicle,
            newPlane,
            game,
            defines,
            true
        )
        --Accelerate the new plane that the player is in so they don't need to press w again
        player.riding_state = {acceleration=defines.riding.acceleration.accelerating, direction=defines.riding.direction.straight}

        -- Start takeoff animation
        if not global.transitionAnimation then
            global.transitionAnimation = {}
        end
        if global.transitionAnimation[player.index] and
           global.transitionAnimation[player.index].valid then
            -- TODO remove old animation
        end
        global.transitionAnimation[player.index] = true -- Indicate animation begun

        return
    end
end

local function planeLand(player, game, defines, settings)
    assert(player.vehicle)
    local groundedName = string.sub(player.vehicle.name, 0, string.len(player.vehicle.name) - string.len("-airborne"))

    -- TODO auto reaccelerate is bad, can dip below landing speed and remain airborne

    -- If player is airborne and plane is less than the specified landing speed
    if utility.isAirbornePlane(player.vehicle.prototype.order) and
       player.vehicle.speed < utility.getLandingSpeed(groundedName) then
        -- Keep the player airborne unless they are intentionally braking to prevent accidental landings
        if settings.get_player_settings(player)["aircraft-realism-auto-accelerate-on-landing-speed-no-brake"].value and player.riding_state.acceleration ~= defines.riding.acceleration.braking then
            player.riding_state = {acceleration=defines.riding.acceleration.accelerating, direction=defines.riding.direction.straight}
            return
        end

        local newPlane = player.surface.create_entity{
            name    =groundedName,
            position=player.position,
            force   =player.force,
            create_build_effect_smoke=false
        }

        -- Brake held, land the plane ==========
        transitionPlane(
            player.vehicle,
            newPlane,
            game,
            defines,
            false
        )

        --Auto brake
        player.riding_state = {acceleration=defines.riding.acceleration.braking, direction=defines.riding.direction.straight}
        return
    end
end

-- Updates the shadow for the player's plane
-- TODO qsec is temporary, animation should be speed dependent
-- TODO this is hardcoded to only handle 10 frames
local function updatePlaneShadow(player, qsec)
    local baseShadowName = "gunship-shadow" -- Without frame

    if global.transitionAnimation and
        global.transitionAnimation[player.index] then

        -- ~= true means a shadow Entity was created
        local newFrame = 0
        if global.transitionAnimation[player.index] ~= true and
            global.transitionAnimation[player.index].valid then
            local oldShadow = global.transitionAnimation[player.index]
            local oldFrame = tonumber(string.sub(oldShadow.prototype.name, string.len(baseShadowName) + 2))

            oldShadow.destroy{}

            -- Forward animation
            newFrame = oldFrame
            if qsec then
                -- Animation completed
                if oldFrame == 9 then
                    global.transitionAnimation[player.index] = nil
                    return
                end
                newFrame = oldFrame + 1
            end
        end

        -- Create new shadow entity
        local newShadowName = baseShadowName .. "-" .. tostring(newFrame)
        local shadow = player.surface.create_entity{
            name=newShadowName,
            -- Using vehicle position instead of player pos fixes shadow jerking up on takeoff
            position=player.vehicle.position,
            force=player.force,
            create_build_effect_smoke=false,
            move_stuck_players=false
        }
        global.transitionAnimation[player.index] = shadow

        shadow.active = false
        -- Use the same fuel as the current plane, as modded planes may use custom fuels
        if shadow.burner then
            assert(player.vehicle.burner, "Plane shadow has burner, plane does not. Check plane prototypes")
            shadow.burner.currently_burning = player.vehicle.burner.currently_burning
            shadow.burner.remaining_burning_fuel = 5000
        end
        shadow.destructible = false
        shadow.minable = false
        shadow.operable = false
        shadow.orientation = player.vehicle.orientation
    end
end

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle and player.surface then
            -- These don't need to be checked as often, so they run off quarterSecond
            local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

            if quarterSecond then
                if utility.isGroundedPlane(player.vehicle.prototype.order) then
                    --Create some smoke effects trailing behind the plane
                    player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}

                    planeTakeoff(player, game, defines, settings)
                elseif utility.isAirbornePlane(player.vehicle.prototype.order) then
                    planeLand(player, game, defines, settings)
                end
            end

            -- TODO the shadow lags slightly behind the plane
            updatePlaneShadow(player, quarterSecond)
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
