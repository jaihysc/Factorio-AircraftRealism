-- All the logic for a plane
local utility = require("logic.utility")

--[[
    Global table:
        lastSpeed[]: number
            Index by player index
            Holds the last speed for the plane the player is in
]]

local function killDriverAndPassenger(plane)
    assert(plane)
    -- get_driver() and get_passenger() returns LuaPlayer OR LuaEntity
    -- die() only exists for LuaEntity
    local driver = plane.get_driver()
    if driver and not driver.is_player() then
        driver.die(driver.force, plane)
    end

    local passenger = plane.get_passenger()
    if passenger and not passenger.is_player() then
        passenger.die(passenger.force, plane)
    end

    plane.die()
end

-- Whether tile below grounded/airborne plane is on a runway
local function onRunway(plane)
    assert(plane)
    local tile = plane.surface.get_tile(plane.position)
    if not tile or not tile.valid then
        return false
    end
    return tile.prototype.vehicle_friction_modifier < settings.global[utility.S_RUNWAY_MAX_FRICTION].value
end

-- Inventory manipulation for plane transitions

-- Copies inventory from oldInventory to newInventory
local function copyInventory(oldInventory, newInventory)
    if oldInventory then
        assert(newInventory, "Old plane has inventory, new plane does not. Check plane prototypes")
        assert(#newInventory == #oldInventory, "Old plane and new plane inventories are different sizes. Check plane prototypes")
        -- With this method, inventory items stay in the same place
        for i = 1, #oldInventory, 1 do
            newInventory[i].set_stack(oldInventory[i])
        end
    end
end

-- Copy burner from oldBurner to newBurner
local function copyBurner(oldBurner, newBurner)
    if oldBurner then
        assert(newBurner, "Old plane has burner, new plane does not. Check plane prototypes")
        copyInventory(oldBurner.inventory, newBurner.inventory)
        copyInventory(oldBurner.burnt_result_inventory, newBurner.burnt_result_inventory)

        newBurner.heat = oldBurner.heat
        newBurner.currently_burning = oldBurner.currently_burning
        -- currently_burning must be set first
        newBurner.remaining_burning_fuel = oldBurner.remaining_burning_fuel
    end
end

-- Copies UI opened for player
local function copyOpened(oldPlane, newPlane, occupant)
    assert(oldPlane)
    assert(newPlane)
    if occupant and occupant.opened then
        -- It appears .opened is bugged in Factorio 2.0.15, only works for the plane GUI, not equipment guid
        if occupant.opened == oldPlane then
            occupant.opened = newPlane
        elseif occupant.opened == oldPlane.grid then
            occupant.opened = newPlane.grid
        end
    end
end

-- Plane takeoff / landing transition
-- Shifts from one plane to another without the player noticing
local function transitionPlane(oldPlane, newPlane)
    assert(oldPlane)
    assert(newPlane)
    newPlane.copy_settings(oldPlane)

    -- LuaEntity

    newPlane.active = oldPlane.active
    newPlane.destructible = oldPlane.destructible
    newPlane.minable = oldPlane.minable
    newPlane.rotatable = oldPlane.rotatable
    newPlane.operable = oldPlane.operable

    -- Scale health in case max health between planes are different
    if oldPlane.health then
        assert(newPlane.health, "Old plane has health, new plane does not. Check plane prototypes")
        newPlane.health = oldPlane.health * newPlane.max_health / oldPlane.max_health
    end

    newPlane.mirroring = oldPlane.mirroring
    newPlane.orientation = oldPlane.orientation

    if oldPlane.relative_turret_orientation then
        assert(newPlane.relative_turret_orientation, "Old plane has relative_turret_orientation, new plane does not. Check plane prototypes")
        newPlane.relative_turret_orientation = oldPlane.relative_turret_orientation
    end

    newPlane.effectivity_modifier = oldPlane.effectivity_modifier
    newPlane.consumption_modifier = oldPlane.consumption_modifier
    newPlane.friction_modifier = oldPlane.friction_modifier

    if oldPlane.driver_is_gunner then
        assert(newPlane.driver_is_gunner, "Old plane has driver_is_gunner, new plane does not. Check plane prototypes")
        newPlane.driver_is_gunner = oldPlane.driver_is_gunner
    end

    if oldPlane.speed then
        assert(newPlane.speed, "Old plane has speed, new plane does not. Check plane prototypes")
        newPlane.speed = oldPlane.speed
    end

    -- Select the last weapon
    if oldPlane.selected_gun_index then
        assert(newPlane.selected_gun_index, "Old plane has selected_gun_index, new plane does not. Check plane prototypes")
        assert(utility.getTableLength(oldPlane.prototype.guns) == utility.getTableLength(newPlane.prototype.guns), "Old plane does not have same number of guns as new plane. Check plane prototypes")
        newPlane.selected_gun_index = oldPlane.selected_gun_index
    end

    newPlane.energy = oldPlane.energy

    if oldPlane.temperature then
        assert(newPlane.temperature, "Old plane has temperature, new plane does not. Check plane prototypes")
        newPlane.temperature = oldPlane.temperature
    end

    if oldPlane.backer_name then
        assert(newPlane.backer_name, "Old plane has backer_name, new plane does not. Check plane prototypes")
        newPlane.backer_name = oldPlane.backer_name
    end

    if oldPlane.color then
        assert(newPlane.color, "Old plane has color, new plane does not. Check plane prototypes")
        newPlane.color = oldPlane.color
    end

    newPlane.last_user = oldPlane.last_user

    -- Transfer over equipment grid
    if oldPlane.grid then
        assert(newPlane.grid, "Old plane has grid, new plane does not. Check plane prototypes")
        assert(oldPlane.grid.width == newPlane.grid.width, "Old plane equipment grid width differs from new plane. Check plane prototypes")
        assert(oldPlane.grid.height == newPlane.grid.height, "Old plane equipment grid height differs from new plane. Check plane prototypes")

        newPlane.grid.inhibit_movement_bonus = oldPlane.grid.inhibit_movement_bonus

        for index,item in pairs(oldPlane.grid.equipment) do
            local addedEquipment = newPlane.grid.put{
                name     = item.name,
                quality  = item.quality,
                position = item.position
            }
            assert(addedEquipment, "Could not insert old plane equipment into new plane. Check plane prototypes")

            -- We must check for non zero, otherwise attempting to set for item which
            -- does not have energy or shield is an error
            if item.energy ~= 0 then addedEquipment.energy = item.energy end
            if item.shield ~= 0 then addedEquipment.shield = item.shield end

            copyBurner(item.burner, addedEquipment.burner)
        end
    end

    if oldPlane.graphics_variation then
        assert(newPlane.graphics_variation, "Old plane has graphics_variation, new plane does not. Check plane prototypes")
        newPlane.graphics_variation = oldPlane.graphics_variation
    end

    copyBurner(oldPlane.burner, newPlane.burner)

    if oldPlane.prototype.allow_run_time_change_of_is_military_target then
        assert(newPlane.prototype.allow_run_time_change_of_is_military_target, "Old plane has allow_run_time_change_of_is_military_target, new plane does not. Check plane prototypes")
        newPlane.is_military_target = oldPlane.is_military_target
    end

    -- Copy name_tag if old plane has one, cannot be set to nil
    if oldPlane.name_tag then
        newPlane.name_tag = oldPlane.name_tag
    end

    if oldPlane.custom_status then
        newPlane.custom_status = oldPlane.custom_status
    end

    newPlane.enable_logistics_while_moving = oldPlane.enable_logistics_while_moving

    -- LuaControl

    -- Copy all the inventories, defines.inventory.*
    for key, value in pairs(defines.inventory) do
        copyInventory(oldPlane.get_inventory(value), newPlane.get_inventory(value))
    end

    newPlane.riding_state = oldPlane.riding_state

    -- Drivers / passengers

    local driver = oldPlane.get_driver()
    local passenger = oldPlane.get_passenger()

    -- Keep the UI open for driver/passenger
    copyOpened(oldPlane, newPlane, driver)
    copyOpened(oldPlane, newPlane, passenger)

    -- Destroy the old plane first before setting the passenger and driver to the new plane or else the game doesn't like it
    oldPlane.destroy{ raise_destroy = true }

    newPlane.set_driver(driver)
    newPlane.set_passenger(passenger)
end

-- Updates / checks that occur on game ticks

-- Checks plane collision with environment
-- Grounded plane only
local function checkCollision(plane)
    assert(plane)
    local surface = plane.surface

    -- Destroy the plane if the player LANDS ON a cliff
    -- for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()-0.4, name = {"cliff"}})) do
    --     if plane.speed == 0 then
    --         killDriverAndPassenger(plane, player)
    --         return
    --     end
    -- end

    -- Destroy the plane upon landing in water
    -- local tile = surface.get_tile(plane.position)
	-- if tile and tile.valid and not utility.getPlaneConfig(plane.name).isSeaplane then
    --     if tile.name == "water" or tile.name == "water-shallow" or tile.name == "water-mud" or tile.name == "water-green" or tile.name == "deepwater" or tile.name == "deepwater-green" then
    --         if plane.speed == 0 then  -- Player + passenger dies too since they will just be stuck anyways
    --             killDriverAndPassenger(plane, player)
    --             return
    --         end
    --     end
    -- end

    -- Destroy plane on large deceleration
    -- TODO figure this out
    if settings.global[utility.S_ENV_IMPACT].value then
        -- if storage.lastSpeed == nil then
        --     storage.lastSpeed = {}
        -- end

        -- if storage.lastSpeed[player.index] then
        --     local acceleration = plane.speed - storage.lastSpeed[player.index]
        --     -- Trigger on deceleration only, not acceleration
        --     if (storage.lastSpeed[player.index] > 0 and acceleration < 0) or (storage.lastSpeed[player.index] < 0 and acceleration > 0) then
        --         -- Stopped (< 5 km/h) with deceleration over 40km/h
        --         if math.abs(plane.speed) < (5 * utility.KPH2MPT) and math.abs(acceleration) > (40 * utility.KPH2MPT) then
        --             storage.lastSpeed[player.index] = nil
        --             plane.die()
        --             return
        --         end
        --     end
        -- end
        -- storage.lastSpeed[player.index] = plane.speed
    else
        storage.lastSpeed = nil
    end
end

-- Checks plane going too fast
-- Grounded or airborne plane
local function checkMaxSpeed(plane)
    assert(plane)
    assert(plane.name)

    local maxSpeed = utility.getPlaneConfig(plane.name).maxSpeed
    if plane.speed and maxSpeed then
        -- Clamp the plane speed to max speed
        if plane.speed > maxSpeed then
            plane.speed = maxSpeed
        end
        if plane.speed < -maxSpeed then
            plane.speed = -maxSpeed
        end
    end
end

-- Creates pollution for plane
-- Grounded or airborne plane
local function checkPollution(plane)
    assert(plane)
    if settings.global[utility.S_EMIT_POLLUTION].value then
        if plane.burner and plane.burner.currently_burning then
            -- More pollution is emitted at higher speeds, also depending on the fuel
            local emissions = settings.global[utility.S_POLLUTION_AMOUNT].value
            emissions = emissions * plane.burner.currently_burning.name.fuel_emissions_multiplier
            plane.surface.pollute(plane.position, emissions * math.abs(plane.speed))
        end
    end
end

-- Checks runway requirement
-- Grounded plane only
local function checkRunway(plane)
    assert(plane)

    if not onRunway(plane) and settings.global[utility.S_RUNWAY_REQUIREMENT].value then
        local maxTaxiSpeed = utility.toFactorioUnit(settings.global[utility.S_RUNWAY_TAXI_SPEED].value)

        local overspeed = math.abs(plane.speed) - maxTaxiSpeed
        if overspeed > 0 then
            -- Decrease speed proportional (k1) to differnce
            local k1 = 0.1
            if plane.speed > 0 then
                plane.speed = plane.speed - (k1 * overspeed)
            elseif plane.speed < 0 then
                plane.speed = plane.speed + (k1 * overspeed)
            end

            -- Damage proportional (k2) to difference
            local k2 = 0.25
            local damage = k2 * overspeed / utility.KPH2MPT
            plane.damage(damage, plane.force, "impact")
        end
    end
end

-- Updates the shadow for the provided plane
-- Airborne plane only
local function checkShadow(plane)
    assert(plane)
    local data = utility.getPlaneConfig(plane.name)

    -- Plane must support shadows
    local shadows = data.shadowSprite
    if #data.shadowSprite == 0 then
        return
    end

    local vBegin = utility.getTransitionSpeed(plane.name)
    local vEnd = vBegin + data.shadowEndSpeed
    local tileOffsetFinal = data.shadowOffset
    local renderlayer = data.shadowLayer
    local alphaInitial = data.shadowAlpha
    local totalFrames = #data.shadowSprite

    if plane.speed > vBegin and plane.speed < vEnd then
        -- Map the orientation to a sprite
        local spriteIdx = utility.orientationToIdx(plane.orientation, totalFrames)
        -- Progress of animation, [0,1)
        -- linear, and polynomial as some animations look better if slower initially
        local progress = (plane.speed - vBegin) / (vEnd - vBegin)
        local nomialProgress = progress * progress

        -- Since the shadow trails by 1 tick, we account for it by moving the shadow forwards using the plane's velocity
        -- Speed in tiles/tick
        local shadowOffsetX = plane.speed * math.sin(2 * math.pi * plane.orientation)
        local shadowOffsetY = plane.speed * -math.cos(2 * math.pi * plane.orientation)

        rendering.draw_sprite{
            sprite = shadows[spriteIdx + 1],
            target = {
                -- Use the vehicle position, if the player's position is used, the shadow flickers
                -- briefly on takeoff
                plane.position.x + shadowOffsetX + tileOffsetFinal[1] * nomialProgress,
                plane.position.y + shadowOffsetY + tileOffsetFinal[2] * nomialProgress
            },
            x_scale = 1 - nomialProgress,
            y_scale = 1 - nomialProgress,
            tint = {0, 0, 0, alphaInitial * (1 - nomialProgress)},
            render_layer = renderlayer,
            surface = plane.surface,
            time_to_live = 1
        }
    end
end

-- Checks if plane should land
-- Airborne plane only
local function checkTransitionLand(plane)
    assert(plane)
    local transitionSpeed = utility.getTransitionSpeed(plane.prototype.name)
    if plane.speed < transitionSpeed then
        local groundedName = utility.getPlaneConfig(plane.prototype.name).groundedName
        -- Direction, player is set in transitionPlane
        local newPlane = plane.surface.create_entity{
            name                      = groundedName,
            position                  = plane.position,
            quality                   = plane.quality,
            force                     = plane.force,
            create_build_effect_smoke = false,
            raise_built               = true
        }
        transitionPlane(plane, newPlane)
    end
end

-- Checks if plane should takeoff
-- Grounded plane only
local function checkTransitionTakeoff(plane)
    assert(plane)
    local transitionSpeed = utility.getTransitionSpeed(plane.prototype.name)
    if plane.speed > transitionSpeed then
        -- Direction, player is set in transitionPlane
        local newPlane = plane.surface.create_entity{
            name                      = utility.getPlaneConfig(plane.prototype.name).airborneName,
            position                  = plane.position,
            quality                   = plane.quality,
            force                     = plane.force,
            create_build_effect_smoke = false,
            raise_built               = true
        }
        transitionPlane(plane, newPlane)
    end
end

-- Events

-- Makes the plane immune against certain sources of damage, e.g., biters
local function onEntityDamaged(e)
    if settings.global[utility.S_AIRBORNE_DAMAGE_IMMUNITY].value then
        if e and e.entity and e.final_damage_amount and e.final_health and e.cause then
            local plane = e.entity
            if utility.isAirbornePlane(plane.prototype.name) then
                plane.health = e.final_health + e.final_damage_amount
            end
        end
    end
end

-- If a player bails out of a speeding plane, destroy it if there is no passenger
function onPlayerDrivingChangedState(e)
    local player = game.get_player(e.player_index)

    if player and not player.driving then
        if e.entity then
            if utility.isAirbornePlane(e.entity.prototype.name) then
                local driver = e.entity.get_driver()
                local passenger = e.entity.get_passenger()
                -- If driver bailed, passenger become the pilot
                if passenger and not driver then
                    e.entity.set_driver(passenger)
                -- If passenger and driver jumps out, plane crashes
                elseif not driver and not passenger then
                    e.entity.die()
                end
            elseif utility.isGroundedPlane(e.entity.prototype.name) then
                -- Driver of the plane MUST NOT exit until the plane has stopped in order for collision logic to work
                local driver = e.entity.get_driver()
                if not driver then
                    if math.abs(e.entity.speed) > (10 * utility.KPH2MPT) then
                        e.entity.set_driver(player)
                    end
                end
            end
        end
    end
end

local printedMessage = false
local function onTick(e)
    if not printedMessage then
        game.print("You are running an early Aircraft Realism release for Factorio 2.0. The Aircraft mod is not supported!")
        printedMessage = true
    end

    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle then
            local plane = player.vehicle
            local grounded = utility.isGroundedPlane(plane.prototype.name)
            local airborne = utility.isAirbornePlane(plane.prototype.name)

            -- Check for .valid as plane may be destroyed
            if grounded then
                if plane.valid then checkCollision(plane) end
                if plane.valid then checkMaxSpeed(plane) end
                if plane.valid then checkPollution(plane) end
                if plane.valid then checkRunway(plane) end
                if plane.valid then checkTransitionTakeoff(plane) end
            elseif airborne then
                if plane.valid then checkMaxSpeed(plane) end
                if plane.valid then checkPollution(plane) end
                if plane.valid then checkShadow(plane) end
                if plane.valid then checkTransitionLand(plane) end
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_entity_damaged] = onEntityDamaged
handlers[defines.events.on_player_driving_changed_state] = onPlayerDrivingChangedState
handlers[defines.events.on_tick] = onTick
return handlers