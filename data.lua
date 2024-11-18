local utility = require("logic.utility")
local NEEDLEPATH = "__AircraftRealism__/graphics/gui/needles/"

-- Fuel indicator needles
for i=0, (utility.UI_FUEL_L_NEEDLE_COUNT - 1) do
    local proto = {}
    proto.type = "sprite"
    proto.name = utility.UI_FUEL_L_NEEDLE_SPRITE_PREFIX .. i
    proto.filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-" .. i .. ".png"
    proto.flags = {"gui"}
    proto.width = 60
    proto.height = 152
    data:extend({proto})
end

-- Right hand side burning fuel indicator
for i=0, (utility.UI_FUEL_R_NEEDLE_COUNT - 1) do
    local proto = {}
    proto.type = "sprite"
    proto.name = utility.UI_FUEL_R_NEEDLE_SPRITE_PREFIX .. i
    proto.filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-" .. i .. ".png"
    proto.flags = {"gui"}
    proto.width = 60
    proto.height = 152
    data:extend({proto})
end

-- Speed indicator needles, 400 of them, each at 4km/h intervals
for i=0, (utility.UI_SPEED_NEEDLE_COUNT - 1) do
    local proto = {}
    proto.type = "sprite"
    proto.name = "aircraft-realism-airspeed-indicator-" .. i
    proto.filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-" .. i .. ".png"
    proto.flags = {"gui"}
    proto.width = 152
    proto.height = 152
    data:extend({proto})
end

-- Warning Speed indicator needles, 400 of them, each at 4km/h intervals
for i=0, (utility.UI_SPEED_NEEDLE_COUNT - 1) do
    local proto = {}
    proto.type = "sprite"
    proto.name = "aircraft-realism-airspeed-indicator-warning-" .. i
    proto.filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-" .. i .. ".png"
    proto.flags = {"gui"}
    proto.width = 152
    proto.height = 152
    data:extend({proto})
end

data:extend({
    -- Sound
    {
        type = "sound",
        name = utility.UI_WARNING_SOUND,
        variations = { filename = "__AircraftRealism__/sound/plane-warn.ogg", volume = 1.5 }
    },
    -- Sprites
    {
        type = "sprite",
        name = utility.UI_SPEED_FRAME_SPRITE,
        filename = "__AircraftRealism__/graphics/gui/airspeed_indicator-base-no-mach.png",
        flags = {"gui"},
        width = 152,
        height = 152
    },
    {
        type = "sprite",
        name = utility.UI_FUEL_FRAME_SPRITE,
        filename = "__AircraftRealism__/graphics/gui/fuel_indicator-base.png",
        flags = {"gui"},
        width = 60,
        height = 152
    },
    {
        type = "sprite",
        name = utility.UI_FUELW_SPRITE,
        flags = {"gui"},
        width = 60,
        height = 152,
        filename = "__AircraftRealism__/graphics/gui/fuel_indicator_emergency_fuel_warning.png"
    },
    -- Shortcut button
    {
        type = "shortcut",
        name = utility.UI_SHOW_TAKEOFF_DIST,
        action = "lua",
        toggleable = true,
        icon = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x32.png",
        icon_size = 32,
        small_icon = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x24.png",
        small_icon_size = 24,
    }
})