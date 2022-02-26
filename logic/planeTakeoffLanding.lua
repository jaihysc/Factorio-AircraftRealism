-- Handles the takeoff and landing of the plane
local utils = require("logic.utility")
local planeUtils = require("logic.planeUtility")

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
        assert(utils.getTableLength(oldPlane.prototype.guns) == utils.getTableLength(newPlane.prototype.guns), "Old plane does not have same number of guns as new plane. Check plane prototypes")
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
    if planeUtils.isGroundedPlane(player.vehicle.prototype.order) and
       player.vehicle.speed > planeUtils.getTakeoffSpeed(player.vehicle.name) then
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
    if planeUtils.isAirbornePlane(player.vehicle.prototype.order) and
       player.vehicle.speed < planeUtils.getLandingSpeed(groundedName) then
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

-- Draws line indicating takeoff distance for player plane
-- lineLife: Ticks to show line drawn
local function showTakeoffDist(player, plane, lineLife)
    assert(player)
    assert(plane)
    assert(type(lineLife) == "number")

    assert(plane.prototype.weight, "Plane prototype missing weight. Check plane prototypes")
    assert(plane.prototype.consumption, "Plane prototype missing consumption. Check plane prototypes")
    assert(plane.prototype.friction_force, "Plane prototype missing friction_force. Check plane prototypes")
    assert(plane.prototype.effectivity, "Plane prototype missing effectivity. Check plane prototypes")

    local maxTime = 15 -- Give up calculation if takeoff time too long

    -- Use SI units to avoid confusion and conversion errors

    local dt = 1/60 -- 1/60 second = 1 tick
    local m = plane.prototype.weight -- Mass (kg)
    -- For speed: tile/tick -> m/s
    local v_0 = plane.speed * 60 -- Initial speed (m/s)
    local v_tk = planeUtils.getTakeoffSpeed(plane.name) * 60 -- Takeoff speed (m/s)
    -- J/tick -> J/s
    local c = plane.prototype.consumption * 60 -- Consumption (W)
    local u_fc = 1 -- Vehicle friction
    u_fc = u_fc * plane.prototype.friction_force
    u_fc = u_fc * plane.friction_modifier

    local u_c = 1 -- Multiplier on consumption
    u_c = u_c * plane.prototype.effectivity
    u_c = u_c * plane.effectivity_modifier
    u_c = u_c * plane.consumption_modifier
    -- Fuel acceleration multiplier
    if plane.burner then
        if plane.burner.currently_burning then
            -- Use burning fuel for acceleration multiplier
            u_c = u_c * plane.burner.currently_burning.fuel_acceleration_multiplier
        elseif plane.burner.inventory then
            -- Use first fuel in fuel slot for acceleration multiplier
            for i = 1, #plane.burner.inventory, 1 do
                local slot = plane.burner.inventory[i]
                if slot.valid_for_read then
                    u_c = u_c * slot.prototype.fuel_acceleration_multiplier
                    break
                end
            end
        end
    end
    -- Acceleration multiplier
    if plane.grid and not plane.grid.inhibit_movement_bonus then
        local bonus = 1
        for i=1, #plane.grid.equipment, 1 do
            local equipment = plane.grid.equipment[i]
            if equipment.energy and equipment.energy > 0 then
                bonus = bonus + equipment.movement_bonus
            end
        end
        u_c = u_c * bonus
    end

    -- Cannot take off with negative speeds, treat as 0
    if v_0 < 0 then
        v_0 = 0
    end

    local E_gain = u_c*c -- Energy plane gains (J/s)
    local E = 0.5 * m * v_0*v_0 -- Initial energy (J)
    local s = 0 -- Initial displacement (m)
    local t = 0 -- Initial time (s)

    -- Construct unit vector to compute plane position
    -- Note this is clockwise from north
    local planeRad = plane.orientation*2*math.pi
    local r_x = math.sin(planeRad)
    local r_y = -math.cos(planeRad) -- Positive y is downwards

    local succeeded = false
    while t < maxTime do
        v = math.sqrt(2*E/m) -- speed
        if v >= v_tk then
            succeeded = true
            break
        end

        t = t + dt

        -- TODO friction calculation for tiles not that accurate
        -- Friction loss is a function of tile currently over
        local u_ft = 1
        local tile = player.surface.get_tile({x=plane.position.x + r_x*s, y=plane.position.y + r_y*s})
        -- Tile may not exist (out of map)
        if tile.valid then
            u_ft = tile.prototype.vehicle_friction_modifier -- Terrain friction
        end
        u_f = 1 - u_fc*(1 + u_ft)

        -- Factorio calculates friction loss as E * friction multiplier
        E = E*u_f + E_gain*dt
        s = s +v*dt
    end

    -- Show orange line to show calculation timed out
    local line_color = {0, 0.5, 0, 0.5} -- Green
    if not succeeded then
        line_color = {0.9, 0.5, 0.1, 0.5} -- Orange
    end
    local takeoffPos = {x=plane.position.x + r_x*s, y=plane.position.y + r_y*s}
    rendering.draw_line{
        surface=player.surface,
        from=plane.position, to=takeoffPos,
        color=line_color,
        width=10,
        time_to_live=lineLife,
        players={player},
        draw_on_ground=true
    }

    -- The player can add their own factor of safety
    --[[
    -- Add a factor of safety to prediction
    local marginDist = 10
    local safeTakeoffPos = {x=takeoffPos.x + r_x*marginDist, y=takeoffPos.y + r_y*marginDist}
    rendering.draw_line{
        surface=player.surface,
        from=takeoffPos, to=safeTakeoffPos,
        color={0.9, 0.5, 0.1, 0.5},
        width=10,
        time_to_live=lineLife,
        players={player},
        draw_on_ground=true
    }
    ]]
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

local functions = {}

functions.planeTakeoff = planeTakeoff
functions.planeLand = planeLand
functions.showTakeoffDist = showTakeoffDist
functions.updatePlaneShadow = updatePlaneShadow

return functions
