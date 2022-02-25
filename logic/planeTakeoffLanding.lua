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

    -- Physics
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
            force   =player.force
        }

        transitionPlane(
            player.vehicle,
            newPlane,
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

local function planeLand(player, game, defines, settings)
    assert(player.vehicle)
    local groundedName = string.sub(player.vehicle.name, 0, string.len(player.vehicle.name) - string.len("-airborne"))

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
            force   =player.force
        }

        -- Brake held, land the plane ==========
        transitionPlane(
            player.vehicle,
            newPlane,
            game,
            defines,
            false
        )

        -- Create some smoke to indicate to the player they have landed
        for i = 1, 5, 1 do
            player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}
        end

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

    local maxTime = 30 -- Give up calculation if takeoff time too long

    -- TODO replace tk/ landing speed
    -- TODO does not handle afterburner

    -- Use SI units to avoid confusion and conversion errors

    local dt = 1/60 -- 1/60 second = 1 tick
    local m = plane.prototype.weight -- Mass (kg)
    -- For speed: tile/tick -> m/s
    local v_0 = plane.speed * 60 -- Initial speed (m/s)
    local v_tk = planeUtils.getTakeoffSpeed(plane.name) * 60 -- Takeoff speed (m/s)
    -- J/tick -> J/s
    local c = plane.prototype.consumption * 60 -- Consumption (W)
    local u_fc = plane.prototype.friction_force -- Car friction
    local u_be = plane.prototype.effectivity -- Effectivity
    -- Fuel acceleration multiplier
    local u_bf = 1
    if plane.burner then
        if plane.burner.currently_burning then
            -- Use burning fuel for acceleration multiplier
            u_bf = plane.burner.currently_burning.fuel_acceleration_multiplier
        elseif plane.burner.inventory then
            -- Use first fuel in fuel slot for acceleration multiplier
            for i = 1, #plane.burner.inventory, 1 do
                local slot = plane.burner.inventory[i]
                if slot.valid_for_read then
                    u_bf = slot.prototype.fuel_acceleration_multiplier
                    break
                end
            end
        end
    end

    -- Cannot take off with negative speeds, treat as 0
    if v_0 < 0 then
        v_0 = 0
    end

    local E_gain = (u_be*u_bf*c) -- Energy plane gains (J/s)
    local E = 0.5 * m * v_0*v_0 -- Initial energy (J)
    local s = 0 -- Initial displacement (m)
    local t = 0 -- Initial time (s)

    -- Construct unit vector to compute plane position
    -- Note this is clockwise from north
    local planeRad = plane.orientation*2*math.pi
    local r_x = math.sin(planeRad)
    local r_y = -math.cos(planeRad) -- Positive y is downwards

    while t < maxTime do
        v = math.sqrt(2*E/m) -- speed
        if v >= v_tk then
            break
        end

        t = t + dt

        -- Friction loss is a function of tile currently over
        local tile = player.surface.get_tile({x=plane.position.x + r_x*s, y=plane.position.y + r_y*s})
        local u_ft = tile.prototype.vehicle_friction_modifier -- Terrain friction
        u_f = 1 - u_fc*(1 + u_ft)

        -- Factorio calculates friction loss as E * friction multiplier
        E = E*u_f + E_gain*dt
        s = s +v*dt
    end

    local takeoffPos = {x=plane.position.x + r_x*s, y=plane.position.y + r_y*s}
    rendering.draw_line{
        surface=player.surface,
        from=plane.position, to=takeoffPos,
        color={0, 0.5, 0, 0.5},
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

local functions = {}

functions.planeTakeoff = planeTakeoff
functions.planeLand = planeLand
functions.showTakeoffDist = showTakeoffDist

return functions
