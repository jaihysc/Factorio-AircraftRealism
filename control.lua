local utility = require("logic.utility")
local planePollution = require("logic.planePollution")

-- Maps event to list of handlers
local eventTable = {}

-- Loads event handlers for module at path (same path used in require)
local function loadModule(path)
    assert(type(path) == "string")
    assert(eventTable)

    local handlers = require(path)
    assert(handlers, "Module did not return event handlers")
    for event, handler in pairs(handlers) do
        assert(type(event) == "number", "Expected event from module")
        assert(type(handler) == "function", "Expected event handler from module")

        -- First handler for event
        if eventTable[event] == nil then
            eventTable[event] = {}
        end
        table.insert(eventTable[event], handler)
    end
end


-- >>> BEGIN MODULES
loadModule("logic.planeTakeoffLanding")
loadModule("logic.showTakeoffDist")
loadModule("logic.guiController")
-- <<< END MODULES


-- Register event handlers to Factorio
for event, handlers in pairs(eventTable) do
    assert(eventTable)

    -- Events under defines.events
    script.on_event(event, function(e)
        assert(e, "Event handler received nil")
        assert(e.name, "Event received missing name")

        local handlers = eventTable[e.name]
        assert(handlers, "Could not find handlers for event")
        for k, handler in pairs(handlers) do
            assert(type(handler) == "function", "Expected event handler for module")
            handler(e)
        end
    end)
end


-- TODO events below no longer called with new system
--[[
    Global table:
        showTakeoffDist[]: LuaEntity
            Index by player index
            Holds the plane the player has selected to show takeoff distance for
        transitionAnimation[]: LuaEntity or boolean
            Index by player index
            Holds the shadow entity which is the current frame in takeoff/landing animation for player plane
            If animation just started and no shadow entity spawned yet, table holds boolean true
]]

-- If a player bails out of a speeding plane, destroy it if there is no passenger
-- I would perfer to have the plane glide away, but there is no easy way that I know of to track them and all the solutions would likely lag if there is a large amount of planes
function OnPlayerDrivingChangedState(e)
    local player = game.get_player(e.player_index)

    if player and not player.driving then
        if e.entity then
            if utility.isAirbornePlane(e.entity.prototype.order) then
                local driver = e.entity.get_driver()
                local passenger = e.entity.get_passenger()
                -- If driver bailed, passenger become the pilot
                if passenger and not driver then
                    e.entity.set_driver(passenger)
                -- If passenger and driver jumps out, plane crashes
                elseif not driver and not passenger then
                    e.entity.die()
                end
            elseif utility.isGroundedPlane(e.entity.prototype.order) then
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

-- Events
--script.on_init(on_init)
--script.on_event(defines.events.on_tick, OnTick)
--script.on_event(defines.events.on_player_driving_changed_state, OnPlayerDrivingChangedState)
--script.on_event(defines.events.on_player_died, OnPlayerDied)
--script.on_event(defines.events.on_lua_shortcut, OnLuaShortcut)