--Adds sprites and sounds for the gui elements
local NEEDLEPATH = "__AircraftRealism__/graphics/gui/needles/"

--Fuel indicator needles
for i=0,31 do
  local proto = {}
  proto.type = "sprite"
  proto.name = "aircraft-realism-fuel-indicator-left-" .. i
  proto.filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-" .. i .. ".png"
  proto.flags = {"gui"}
  proto.width = 60
  proto.height = 152
  data:extend({proto})
end

-- Right hand side burning fuel indicator
for i=0,30 do
  local proto = {}
  proto.type = "sprite"
  proto.name = "aircraft-realism-fuel-indicator-right-" .. i
  proto.filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-" .. i .. ".png"
  proto.flags = {"gui"}
  proto.width = 60
  proto.height = 152
  data:extend({proto})
end

--Speed indicator needles, 400 of them, each at 4km/h intervals
for i=0,399 do
  local proto = {}
  proto.type = "sprite"
  proto.name = "aircraft-realism-airspeed-indicator-" .. i
  proto.filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-" .. i .. ".png"
  proto.flags = {"gui"}
  proto.width = 152
  proto.height = 152
  data:extend({proto})
end

--Warning Speed indicator needles, 400 of them, each at 4km/h intervals
for i=0,399 do
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
    name = "aircraft-realism-sound-master-warning",
    variations = { filename = "__AircraftRealism__/sound/plane-warn.ogg", volume = 1.5 }
  },
  -- Sprites
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-base",
    filename = "__AircraftRealism__/graphics/gui/airspeed_indicator-base-no-mach.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-base",
    filename = "__AircraftRealism__/graphics/gui/fuel_indicator-base.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-emergency-fuel-warning",
    flags = {"gui"},
    width = 60,
    height = 152,
    filename = "__AircraftRealism__/graphics/gui/fuel_indicator_emergency_fuel_warning.png"
  },
  -- Shortcut button
  {
    type = "shortcut",
    name = "aircraft-realism-show-takeoff-distance",
    action = "lua",
    toggleable = true,
    disabled_icon = {
        filename = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x32-white.png",
        flags = {
          "gui-icon"
        },
        priority = "extra-high-no-scale",
        size = 32
    },
    disabled_small_icon = {
        filename = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x24-white.png",
        flags = {
          "gui-icon"
        },
        priority = "extra-high-no-scale",
        size = 24
    },
    icon = {
      filename = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x32.png",
      flags = {
        "gui-icon"
      },
      priority = "extra-high-no-scale",
      size = 32
    },
    small_icon = {
      filename = "__AircraftRealism__/graphics/icons/show-takeoff-dist-x24.png",
      flags = {
        "gui-icon"
      },
      priority = "extra-high-no-scale",
      size = 24
    }
  }
})