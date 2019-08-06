local guiController = require("logic.guiController")
local planeManager = require("logic.planeManager")
local planeUtility = require("logic.planeUtility")
local planePollution = require("logic.planePollution")

--Only functions for events are here, other functions are called from here

function OnTick(e)
    for index,player in pairs(game.connected_players) do  -- loop through all online players on the server

        -- if they are in a plane
        if player.character and player.driving then
            planeManager.checkPlanes(e, player, game, defines, settings)
        end
    end
end

-- If a player bails out of a speeding plane, destroy it if there is no passenger
-- I would perfer to have the plane glide away, but there is no easy way that I know of to track them and all the solutions would likely lag if there is a large amount of planes
function OnPlayerDrivingChangedState(e)
    local player = game.get_player(e.player_index)

    if e.entity and player.driving and planeUtility.isGroundedPlane(e.entity.name) and e.entity.speed == 0 then -- Create gauges upon entering a plane
        guiController.initializeGauges(player)
    end

    if not player.driving then
        if e.entity and planeUtility.isAirbornePlane(e.entity.name) then
            -- If there is a passenger in the plane, they become the pilot
            local passenger = e.entity.get_passenger()
            if passenger then
                e.entity.set_driver(passenger)
            else
                e.entity.die()
            end
        end

        -- Destroy gauges upon leaving a plane
        guiController.deleteGauges(player)
    end
end

-- Special function for the helicopter mod
function CheckHelicopterMod(player)
    if player.vehicle.name == "heli-entity-_-" then
        planePollution.createPollution(settings, player.surface, player.vehicle)
    end
end

-- Events
script.on_event(defines.events.on_tick, OnTick)
script.on_event(defines.events.on_player_driving_changed_state, OnPlayerDrivingChangedState)