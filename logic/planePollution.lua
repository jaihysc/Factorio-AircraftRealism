local utility = require("logic.utility")

-- Handles polluting the surface
local function createPollution(settings, surface, plane)
    if settings.global["aircraft-emit-pollution"].value then
        if plane.burner and plane.burner.currently_burning then
            -- More pollution is emitted at higher speeds, also depending on the fuel
            local emissions = settings.global["aircraft-pollution-amount"].value
            emissions = emissions * plane.burner.currently_burning.fuel_emissions_multiplier
            surface.pollute(plane.position, emissions * math.abs(plane.speed))
        end
    end
end

-- TODO should this be removed?
-- Special function for the helicopter mod
function CheckHelicopterMod(player)
    assert(player.vehicle)
    if player.vehicle.name == "heli-entity-_-" then
        createPollution(settings, player.surface, player.vehicle)
    end
end

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle and player.surface then
            -- These don't need to be checked as often, so they run off quarterSecond
            local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

            if quarterSecond then
                CheckHelicopterMod(player)
                if utility.isPlane(player.vehicle.prototype.name) then
                    createPollution(settings, player.surface, player.vehicle)
                end
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
