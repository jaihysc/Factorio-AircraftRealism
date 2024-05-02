-- If you are interested in how the mod scripts are structured, see Docs/ScriptImplementation.md
-- Below sets up all the event handlers for each of the modules, add additional modules between
-- the >>> BEGIN MODULES and <<< END MODULES

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
loadModule("logic.planePollution")
loadModule("logic.planeCollisions")
loadModule("logic.planeMaxSpeed")
loadModule("logic.planeRunway")
loadModule("logic.driverExited")
loadModule("logic.damageImmunity")
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
