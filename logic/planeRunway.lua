-- Runway tile material checker
local utils = require("logic.utility")

local function validateRunwayTile(settings, surface, plane)
    local tile = surface.get_tile(plane.position)
    -- player.print(tile.name .. " | " ..tile.prototype.vehicle_friction_modifier) --For debug testing different surfaces

    -- If strict runways are set, limit the plane's speed when not on runway material, dealing damage if landing on it
    if settings.global["aircraft-realism-strict-runway-checking"].value and tile ~= nil and tile.valid then

        -- Cap the max speed to the max taxi speed when not on a runway
        if tile.prototype.vehicle_friction_modifier > settings.global["aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction"].value then

            --Take off 10% of speed and damage the plane if past the max taxi speed by 2x
            if plane.speed > utils.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) or
               plane.speed < -1 * utils.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) then
                if plane.speed > 0 then
                    plane.speed = plane.speed - 0.00925 -- decrease speed by 2km/h per tick
                elseif plane.speed < 0 then
                    plane.speed = plane.speed + 0.00925
                end

                -- Damage the plane if past the max taxi speed, this should only apply on landing, I added a margin of 20km/h so one should not be able to accelerate faster than it unless in jet or has afterburners
                if plane.speed > utils.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) + 0.09259 or
                   plane.speed < -1 * utils.toFactorioUnit(settings, settings.global["aircraft-realism-strict-runway-max-taxi-speed"].value) - 0.009259  then
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

-- Makes these functions available to the lua script which requires this file
local functions = {}

functions.validateRunwayTile = validateRunwayTile

return functions