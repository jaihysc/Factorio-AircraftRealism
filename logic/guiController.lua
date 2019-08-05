require("mod-gui")

local functions = {}

local function initialize(player)
    local frame_flow = mod_gui.get_frame_flow(player)
    local aircraft_information_frame = frame_flow.add{
        type = "frame",
        name = "new-game-plus-config-frame",
        direction = "horizontal"
    }
    aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-fuel-indicator-base",
        sprite = "aircraft-realism-fuel-indicator-base"
    }
    aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-base",
        sprite = "aircraft-realism-airspeed-indicator-base"
    }
end

--Return all the functions for gui back to control
functions.initialize = initialize

return functions