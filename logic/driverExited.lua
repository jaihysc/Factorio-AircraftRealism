-- Handles what to do if the driver (pilot exits the plane)
local utility = require("logic.utility")

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
                    -- ~10km/h
                    if e.entity.speed > 0.04629 or e.entity.speed < -0.04629 then
                        e.entity.set_driver(player)
                    end
                end
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_player_driving_changed_state] = onPlayerDrivingChangedState
return handlers
