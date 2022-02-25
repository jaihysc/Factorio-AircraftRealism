local guiController = require("logic.guiController")
local planeManager = require("logic.planeManager")
local planeTakeoffLanding = require("logic.planeTakeoffLanding")
local planeUtility = require("logic.planeUtility")
local planePollution = require("logic.planePollution")

local showTakeoffDistShortcut = "aircraft-realism-show-takeoff-distance"

--[[
    Global table:
        showTakeoffDist[]: LuaEntity
            Index by player index
            Holds the plane the player has selected to show takeoff distance for
]]

function OnTick(e)
    for index,player in pairs(game.connected_players) do  -- loop through all online players on the server
        if player then
            -- Set takeoff distance line target to currently hovered over
            -- if on same force
            if player.selected and
               player.selected.force == player.force and
               planeUtility.isGroundedPlane(player.selected.prototype.order) and
               player.is_shortcut_toggled(showTakeoffDistShortcut) then
                if not global.showTakeoffDist then
                    global.showTakeoffDist = {}
                end
                global.showTakeoffDist[player.index] = player.selected
            end
            -- Draw takeoff distance line
            if global.showTakeoffDist and
               global.showTakeoffDist[player.index] then
                if global.showTakeoffDist[player.index].valid then
                    planeTakeoffLanding.showTakeoffDist(player, global.showTakeoffDist[player.index], 2)
                else
                    -- Plane gone (destroyed, took off, etc)
                    global.showTakeoffDist[player.index] = nil
                end
            end

            -- if they are in a plane
            if player.driving and
            player.vehicle then  -- This fixes a crash of nil vehicle when trying to ride the rocket
                planeManager.checkPlanes(e, player, game, defines, settings)
            end
        end
    end
end

-- If a player bails out of a speeding plane, destroy it if there is no passenger
-- I would perfer to have the plane glide away, but there is no easy way that I know of to track them and all the solutions would likely lag if there is a large amount of planes
function OnPlayerDrivingChangedState(e)
    local player = game.get_player(e.player_index)

    if player and not player.driving then
        if e.entity then
            if planeUtility.isAirbornePlane(e.entity.prototype.order) then
                local driver = e.entity.get_driver()
                local passenger = e.entity.get_passenger()
                -- If driver bailed, passenger become the pilot
                if passenger and not driver then
                    e.entity.set_driver(passenger)
                -- If passenger and driver jumps out, plane crashes
                elseif not driver and not passenger then
                    e.entity.die()
                end
            elseif planeUtility.isGroundedPlane(e.entity.prototype.order) then
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

        -- Destroy gauges upon leaving a plane
        -- The gauges are recreated later if the player is still in plane
        guiController.deleteGauges(player)
    end
end

-- When a player dies and respawns, delete their gauges
function OnPlayerDied(e)
    local player = game.get_player(e.player_index)
    if player then
        guiController.deleteGauges(player)
    end
end

function OnLuaShortcut(e)
    if e.prototype_name == showTakeoffDistShortcut then
        local player = game.get_player(e.player_index)
        if player then
            local newState = not player.is_shortcut_toggled(showTakeoffDistShortcut)
            player.set_shortcut_toggled(showTakeoffDistShortcut, newState)

            -- Stop showing takeoff distance
            if newState == false and
               global.showTakeoffDist and
               global.showTakeoffDist[player.index] then
                global.showTakeoffDist[player.index] = nil
            end
        end
    end
end

-- Special function for the helicopter mod
function CheckHelicopterMod(player)
    assert(player.vehicle)
    if player.vehicle.name == "heli-entity-_-" then
        planePollution.createPollution(settings, player.surface, player.vehicle)
    end
end

-- Events
script.on_event(defines.events.on_tick, OnTick)
script.on_event(defines.events.on_player_driving_changed_state, OnPlayerDrivingChangedState)
script.on_event(defines.events.on_player_died, OnPlayerDied)
script.on_event(defines.events.on_lua_shortcut, OnLuaShortcut)