require("mod-gui")
local utils = require("logic.utility")

local functions = {}

--Draws the fuel and airspeed gauges withOUT arrows on the hud
local function initializeGauges(player)
    local frame_flow = mod_gui.get_frame_flow(player)
    local aircraft_information_frame = frame_flow.add{
        type = "frame",
        name = "aircraft-realism-gauge-frame",
        direction = "horizontal"
    }
    local fuel_indicator = aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-fuel-indicator-base",
        sprite = "aircraft-realism-fuel-indicator-base"
    }
    local speed_indicator = aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-base",
        sprite = "aircraft-realism-airspeed-indicator-base"
    }
end

local function getGaugeGui(player)
    local gui_elements = mod_gui.get_frame_flow(player)

    --Find the aircraft gauge element and delete it
    -- gui_elements["aircraft-realism-gauge-frame"].destroy()

    for i,element in pairs(gui_elements.children) do
        if element.name == "aircraft-realism-gauge-frame" then
            return element
        end
    end
end

local function deleteGauges(player)
    local gauge = getGaugeGui(player)
    if gauge then
        gauge.destroy()
    end
end

--Updates the speed and fuel gauge arrows
local function updateGaugeArrows(player, settings)
    if not player.vehicle then
        return
    end

    local gauge = getGaugeGui(player)["aircraft-realism-airspeed-indicator-base"]

    --Airspeed
    --Speed of vehicle devided by 4 since we have 400 needle positions out of 1600 on the gauge
    local gaugeIndex = math.abs(utils.roundNumber(utils.fromFactorioUnit(settings, player.vehicle.speed) / 4))

    gauge.clear()
    gauge.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-needle",
        sprite = "aircraft-realism-airspeed-indicator-" .. gaugeIndex
    }
end

--Return all the functions for gui back to control
functions.initializeGauges = initializeGauges
functions.deleteGauges = deleteGauges
functions.updateGaugeArrows = updateGaugeArrows

return functions