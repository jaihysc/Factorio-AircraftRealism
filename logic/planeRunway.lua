-- Runway tile material checker
local utility = require("logic.utility")

local function validateRunwayTile(settings, surface, plane)
    local tile = surface.get_tile(plane.position)
    -- player.print(tile.name .. " | " ..tile.prototype.vehicle_friction_modifier) --For debug testing different surfaces

    -- If strict runways are set, limit the plane's speed when not on runway material, dealing damage if landing on it
    if settings.global["aircraft-realism-strict-runway-checking"].value and tile ~= nil and tile.valid then

        -- Cap the max speed to the max taxi speed when not on a runway
        if tile.prototype.vehicle_friction_modifier > settings.global["aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction"].value then

            if plane.speed > utility.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) or
               plane.speed < -1 * utility.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) then
                if plane.speed > 0 then
                    plane.speed = plane.speed - 0.00925 -- decrease speed by 2km/h per tick
                elseif plane.speed < 0 then
                    plane.speed = plane.speed + 0.00925
                end

                -- Damage the plane if past the max taxi speed, margin of 20km/h so less easy to accidently damage plane
                if plane.speed > utility.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) + 0.09259 or
                   plane.speed < -1 * utility.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) - 0.009259  then
                    plane.health = plane.health - 1

                    if plane.health <= 0 then
                        plane.die()
                        return false -- False to indicate plane is already destroyed
                    end
                end
            end
        end
    end

    return true
end

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle and player.surface then
            -- Reduce performance impact, don't need to be checked as often, so run off quarterSecond
            local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

            if quarterSecond and utility.isGroundedPlane(player.vehicle.prototype.order) then
                validateRunwayTile(settings, player.surface, player.vehicle)
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
