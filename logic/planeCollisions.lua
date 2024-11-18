-- Handles environmental collisions of the plane WITH DRIVER (cliffs, water)
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

local function obstacleCollision(plane)
    assert(plane)
    local surface = plane.surface

    -- Destroy the plane if the player LANDS ON a cliff
    for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()-0.4, name = {"cliff"}})) do
        if plane.speed == 0 then
            killDriverAndPassenger(plane, player)
            return
        end
    end

    -- Destroy the plane upon landing in water
    local tile = surface.get_tile(plane.position)
	if tile and tile.valid and not utility.getData(plane.name).isSeaplane then
        if tile.name == "water" or tile.name == "water-shallow" or tile.name == "water-mud" or tile.name == "water-green" or tile.name == "deepwater" or tile.name == "deepwater-green" then
            if plane.speed == 0 then  -- Player + passenger dies too since they will just be stuck anyways
                killDriverAndPassenger(plane, player)
                return
            end
        end
    end

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

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle then
            -- Collision gets checked every tick for accuracy
            if utility.isGroundedPlane(player.vehicle.prototype.name) then
                obstacleCollision(player.vehicle)
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
