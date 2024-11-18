local utility = require("logic.utility")

-- Creates pollution for plane
local function pollute(plane)
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

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle and player.surface then
            -- These don't need to be checked as often, so they run off quarterSecond
            local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

            if quarterSecond then
                if utility.isPlane(player.vehicle.prototype.name) then
                    pollute(player.vehicle)
                end
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
