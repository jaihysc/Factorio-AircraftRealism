-- Handles environmental collisions of the plane WITH DRIVER (cliffs, water)
local utility = require("logic.utility")

--[[
    Global table:
        lastSpeed[]: number
            Index by player index
            Holds the last speed for the plane the player is in
]]

local function obstacleCollision(settings, surface, player, plane)

    -- Destroy the plane if the player LANDS ON a cliff
    for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()-0.4, name = {"cliff"}})) do
        if plane.speed == 0 then
            utility.killDriverAndPassenger(plane, player)

            return;
        end
    end
    -- Destroy the plane upon landing in water
    local tile = surface.get_tile(plane.position)
	if tile == nil or not tile.valid then
		return;
	end
    if not utility.getData(plane.name).isSeaplane then
        if tile.name == "water" or tile.name == "water-shallow" or tile.name == "water-mud"or tile.name == "water-green" or tile.name == "deepwater" or tile.name == "deepwater-green" then
            if plane.speed == 0 then  --Player + passenger dies too since they will just be stuck anyways
                utility.killDriverAndPassenger(plane, player)

                return;
            end
        end
    end

    if settings.global["aircraft-realism-environmental-impact"].value then
        if global.lastSpeed == nil then
            global.lastSpeed = {}
        end

        -- Destroy plane on large deceleration
        if global.lastSpeed[player.index] then
            local acceleration = plane.speed - global.lastSpeed[player.index]
            -- Trigger on deceleration only, not acceleration
            if (global.lastSpeed[player.index] > 0 and acceleration < 0) or (global.lastSpeed[player.index] < 0 and acceleration > 0) then
                -- Stopped (< 5 km/h) with deceleration over 40km/h
                if math.abs(plane.speed) < 5 / 216 and math.abs(acceleration) > 40 / 216 then
                    plane.die()
                    return
                end
            end
        end
        global.lastSpeed[player.index] = plane.speed
    end
end

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle and player.surface then
            -- Collision gets checked every tick for accuracy
            if utility.isGroundedPlane(player.vehicle.prototype.name) then
                -- Test for obstacle collision (water, cliff)
                obstacleCollision(settings, player.surface, player, player.vehicle)
            end
        else
            -- Clear last speed (Fixes bug with planes getting destroyed when you enter)
            if global.lastSpeed and global.lastSpeed[player.index] then
                global.lastSpeed[player.index] = nil
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
