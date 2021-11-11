--Adds sprites and sounds for the gui elements
local NEEDLEPATH = "__AircraftRealism__/graphics/gui/needles/"

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
  -- Below contains...
  -- Fuel indicator bar left, 0 - 31
  -- Fuel indicator bar right, 0 - 30

  -- Airspeed needle, 0 - 399
  -- Airspeed warning needle, 0 - 3999

  -- for i in range(31):
  -- print("{\ntype = \"sprite\",\nname = \"aircraft-realism-fuel-indicator-right-" + str(i) + "\",\nfilename = \NEEDLEPATH .. "fuel-left/burning_fuel_indicator_bar-" + str(i) + ".png\",\nflags = {\"gui\"},\nwidth = 60,\nheight = 152\n},")
  --
  { --Fuel indicator needles
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-0",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-0.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-1",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-1.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-2",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-2.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-3",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-3.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-4",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-4.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-5",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-5.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-6",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-6.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-7",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-7.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-8",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-8.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-9",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-9.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-10",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-10.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-11",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-11.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-12",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-12.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-13",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-13.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-14",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-14.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-15",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-15.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-16",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-16.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-17",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-17.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-18",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-18.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-19",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-19.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-20",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-20.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-21",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-21.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-22",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-22.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-23",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-23.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-24",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-24.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-25",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-25.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-26",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-26.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-27",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-27.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-28",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-28.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-29",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-29.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-30",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-30.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-left-31",
    filename = NEEDLEPATH .. "fuel-left/fuel_indicator_bar-31.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  { -- Right hand side burning fuel indicator
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-0",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-0.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-1",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-1.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-2",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-2.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-3",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-3.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-4",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-4.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-5",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-5.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-6",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-6.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-7",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-7.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-8",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-8.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-9",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-9.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-10",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-10.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-11",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-11.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-12",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-12.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-13",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-13.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-14",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-14.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-15",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-15.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-16",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-16.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-17",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-17.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-18",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-18.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-19",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-19.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-20",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-20.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-21",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-21.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-22",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-22.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-23",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-23.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-24",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-24.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-25",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-25.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-26",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-26.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-27",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-27.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-28",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-28.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-29",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-29.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-fuel-indicator-right-30",
    filename = NEEDLEPATH .. "fuel-right/burning_fuel_indicator_bar-30.png",
    flags = {"gui"},
    width = 60,
    height = 152
  },
  { --Speed indicator needles, 400 of them, each at 4km/h intervals, autogenerated of course because I would go insane
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-0",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-0.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-1",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-1.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-2",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-2.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-3",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-3.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-4",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-4.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-5",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-5.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-6",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-6.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-7",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-7.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-8",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-8.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-9",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-9.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-10",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-10.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-11",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-11.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-12",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-12.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-13",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-13.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-14",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-14.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-15",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-15.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-16",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-16.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-17",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-17.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-18",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-18.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-19",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-19.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-20",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-20.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-21",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-21.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-22",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-22.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-23",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-23.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-24",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-24.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-25",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-25.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-26",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-26.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-27",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-27.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-28",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-28.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-29",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-29.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-30",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-30.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-31",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-31.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-32",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-32.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-33",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-33.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-34",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-34.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-35",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-35.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-36",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-36.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-37",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-37.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-38",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-38.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-39",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-39.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-40",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-40.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-41",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-41.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-42",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-42.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-43",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-43.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-44",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-44.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-45",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-45.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-46",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-46.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-47",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-47.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-48",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-48.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-49",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-49.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-50",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-50.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-51",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-51.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-52",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-52.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-53",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-53.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-54",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-54.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-55",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-55.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-56",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-56.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-57",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-57.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-58",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-58.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-59",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-59.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-60",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-60.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-61",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-61.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-62",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-62.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-63",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-63.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-64",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-64.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-65",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-65.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-66",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-66.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-67",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-67.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-68",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-68.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-69",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-69.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-70",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-70.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-71",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-71.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-72",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-72.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-73",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-73.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-74",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-74.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-75",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-75.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-76",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-76.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-77",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-77.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-78",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-78.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-79",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-79.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-80",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-80.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-81",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-81.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-82",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-82.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-83",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-83.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-84",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-84.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-85",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-85.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-86",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-86.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-87",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-87.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-88",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-88.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-89",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-89.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-90",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-90.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-91",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-91.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-92",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-92.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-93",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-93.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-94",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-94.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-95",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-95.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-96",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-96.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-97",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-97.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-98",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-98.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-99",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-99.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-100",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-100.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-101",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-101.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-102",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-102.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-103",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-103.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-104",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-104.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-105",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-105.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-106",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-106.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-107",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-107.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-108",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-108.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-109",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-109.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-110",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-110.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-111",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-111.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-112",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-112.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-113",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-113.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-114",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-114.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-115",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-115.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-116",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-116.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-117",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-117.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-118",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-118.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-119",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-119.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-120",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-120.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-121",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-121.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-122",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-122.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-123",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-123.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-124",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-124.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-125",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-125.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-126",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-126.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-127",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-127.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-128",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-128.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-129",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-129.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-130",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-130.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-131",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-131.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-132",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-132.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-133",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-133.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-134",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-134.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-135",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-135.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-136",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-136.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-137",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-137.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-138",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-138.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-139",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-139.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-140",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-140.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-141",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-141.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-142",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-142.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-143",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-143.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-144",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-144.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-145",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-145.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-146",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-146.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-147",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-147.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-148",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-148.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-149",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-149.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-150",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-150.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-151",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-151.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-152",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-152.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-153",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-153.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-154",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-154.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-155",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-155.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-156",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-156.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-157",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-157.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-158",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-158.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-159",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-159.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-160",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-160.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-161",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-161.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-162",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-162.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-163",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-163.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-164",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-164.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-165",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-165.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-166",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-166.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-167",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-167.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-168",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-168.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-169",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-169.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-170",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-170.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-171",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-171.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-172",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-172.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-173",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-173.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-174",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-174.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-175",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-175.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-176",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-176.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-177",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-177.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-178",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-178.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-179",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-179.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-180",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-180.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-181",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-181.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-182",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-182.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-183",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-183.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-184",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-184.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-185",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-185.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-186",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-186.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-187",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-187.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-188",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-188.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-189",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-189.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-190",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-190.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-191",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-191.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-192",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-192.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-193",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-193.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-194",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-194.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-195",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-195.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-196",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-196.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-197",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-197.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-198",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-198.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-199",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-199.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-200",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-200.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-201",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-201.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-202",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-202.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-203",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-203.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-204",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-204.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-205",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-205.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-206",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-206.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-207",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-207.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-208",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-208.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-209",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-209.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-210",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-210.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-211",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-211.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-212",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-212.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-213",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-213.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-214",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-214.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-215",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-215.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-216",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-216.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-217",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-217.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-218",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-218.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-219",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-219.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-220",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-220.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-221",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-221.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-222",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-222.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-223",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-223.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-224",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-224.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-225",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-225.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-226",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-226.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-227",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-227.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-228",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-228.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-229",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-229.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-230",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-230.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-231",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-231.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-232",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-232.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-233",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-233.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-234",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-234.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-235",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-235.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-236",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-236.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-237",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-237.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-238",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-238.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-239",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-239.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-240",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-240.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-241",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-241.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-242",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-242.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-243",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-243.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-244",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-244.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-245",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-245.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-246",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-246.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-247",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-247.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-248",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-248.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-249",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-249.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-250",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-250.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-251",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-251.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-252",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-252.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-253",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-253.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-254",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-254.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-255",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-255.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-256",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-256.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-257",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-257.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-258",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-258.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-259",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-259.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-260",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-260.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-261",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-261.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-262",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-262.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-263",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-263.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-264",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-264.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-265",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-265.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-266",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-266.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-267",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-267.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-268",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-268.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-269",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-269.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-270",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-270.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-271",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-271.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-272",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-272.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-273",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-273.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-274",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-274.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-275",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-275.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-276",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-276.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-277",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-277.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-278",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-278.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-279",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-279.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-280",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-280.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-281",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-281.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-282",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-282.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-283",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-283.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-284",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-284.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-285",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-285.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-286",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-286.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-287",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-287.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-288",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-288.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-289",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-289.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-290",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-290.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-291",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-291.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-292",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-292.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-293",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-293.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-294",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-294.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-295",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-295.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-296",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-296.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-297",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-297.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-298",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-298.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-299",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-299.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-300",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-300.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-301",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-301.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-302",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-302.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-303",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-303.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-304",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-304.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-305",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-305.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-306",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-306.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-307",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-307.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-308",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-308.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-309",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-309.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-310",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-310.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-311",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-311.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-312",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-312.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-313",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-313.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-314",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-314.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-315",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-315.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-316",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-316.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-317",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-317.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-318",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-318.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-319",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-319.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-320",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-320.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-321",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-321.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-322",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-322.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-323",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-323.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-324",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-324.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-325",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-325.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-326",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-326.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-327",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-327.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-328",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-328.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-329",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-329.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-330",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-330.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-331",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-331.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-332",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-332.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-333",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-333.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-334",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-334.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-335",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-335.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-336",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-336.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-337",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-337.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-338",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-338.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-339",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-339.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-340",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-340.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-341",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-341.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-342",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-342.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-343",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-343.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-344",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-344.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-345",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-345.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-346",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-346.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-347",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-347.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-348",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-348.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-349",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-349.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-350",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-350.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-351",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-351.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-352",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-352.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-353",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-353.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-354",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-354.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-355",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-355.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-356",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-356.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-357",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-357.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-358",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-358.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-359",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-359.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-360",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-360.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-361",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-361.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-362",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-362.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-363",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-363.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-364",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-364.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-365",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-365.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-366",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-366.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-367",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-367.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-368",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-368.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-369",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-369.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-370",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-370.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-371",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-371.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-372",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-372.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-373",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-373.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-374",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-374.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-375",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-375.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-376",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-376.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-377",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-377.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-378",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-378.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-379",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-379.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-380",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-380.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-381",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-381.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-382",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-382.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-383",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-383.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-384",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-384.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-385",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-385.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-386",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-386.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-387",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-387.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-388",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-388.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-389",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-389.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-390",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-390.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-391",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-391.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-392",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-392.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-393",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-393.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-394",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-394.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-395",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-395.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-396",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-396.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-397",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-397.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-398",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-398.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-399",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_needle-399.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
    { --Warning Speed indicator needles, 400 of them, each at 4km/h intervals
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-0",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-0.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-1",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-1.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-2",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-2.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-3",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-3.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-4",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-4.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-5",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-5.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-6",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-6.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-7",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-7.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-8",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-8.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-9",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-9.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-10",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-10.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-11",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-11.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-12",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-12.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-13",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-13.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-14",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-14.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-15",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-15.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-16",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-16.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-17",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-17.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-18",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-18.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-19",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-19.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-20",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-20.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-21",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-21.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-22",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-22.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-23",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-23.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-24",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-24.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-25",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-25.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-26",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-26.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-27",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-27.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-28",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-28.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-29",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-29.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-30",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-30.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-31",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-31.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-32",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-32.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-33",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-33.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-34",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-34.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-35",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-35.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-36",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-36.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-37",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-37.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-38",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-38.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-39",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-39.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-40",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-40.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-41",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-41.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-42",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-42.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-43",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-43.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-44",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-44.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-45",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-45.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-46",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-46.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-47",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-47.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-48",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-48.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-49",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-49.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-50",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-50.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-51",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-51.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-52",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-52.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-53",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-53.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-54",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-54.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-55",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-55.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-56",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-56.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-57",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-57.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-58",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-58.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-59",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-59.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-60",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-60.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-61",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-61.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-62",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-62.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-63",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-63.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-64",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-64.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-65",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-65.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-66",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-66.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-67",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-67.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-68",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-68.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-69",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-69.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-70",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-70.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-71",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-71.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-72",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-72.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-73",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-73.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-74",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-74.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-75",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-75.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-76",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-76.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-77",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-77.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-78",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-78.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-79",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-79.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-80",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-80.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-81",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-81.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-82",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-82.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-83",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-83.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-84",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-84.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-85",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-85.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-86",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-86.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-87",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-87.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-88",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-88.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-89",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-89.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-90",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-90.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-91",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-91.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-92",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-92.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-93",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-93.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-94",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-94.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-95",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-95.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-96",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-96.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-97",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-97.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-98",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-98.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-99",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-99.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-100",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-100.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-101",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-101.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-102",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-102.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-103",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-103.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-104",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-104.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-105",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-105.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-106",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-106.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-107",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-107.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-108",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-108.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-109",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-109.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-110",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-110.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-111",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-111.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-112",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-112.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-113",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-113.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-114",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-114.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-115",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-115.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-116",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-116.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-117",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-117.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-118",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-118.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-119",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-119.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-120",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-120.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-121",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-121.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-122",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-122.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-123",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-123.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-124",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-124.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-125",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-125.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-126",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-126.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-127",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-127.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-128",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-128.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-129",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-129.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-130",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-130.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-131",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-131.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-132",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-132.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-133",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-133.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-134",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-134.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-135",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-135.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-136",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-136.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-137",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-137.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-138",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-138.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-139",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-139.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-140",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-140.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-141",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-141.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-142",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-142.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-143",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-143.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-144",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-144.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-145",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-145.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-146",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-146.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-147",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-147.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-148",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-148.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-149",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-149.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-150",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-150.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-151",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-151.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-152",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-152.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-153",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-153.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-154",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-154.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-155",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-155.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-156",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-156.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-157",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-157.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-158",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-158.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-159",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-159.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-160",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-160.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-161",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-161.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-162",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-162.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-163",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-163.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-164",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-164.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-165",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-165.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-166",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-166.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-167",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-167.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-168",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-168.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-169",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-169.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-170",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-170.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-171",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-171.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-172",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-172.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-173",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-173.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-174",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-174.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-175",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-175.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-176",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-176.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-177",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-177.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-178",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-178.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-179",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-179.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-180",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-180.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-181",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-181.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-182",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-182.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-183",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-183.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-184",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-184.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-185",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-185.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-186",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-186.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-187",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-187.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-188",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-188.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-189",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-189.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-190",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-190.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-191",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-191.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-192",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-192.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-193",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-193.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-194",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-194.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-195",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-195.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-196",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-196.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-197",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-197.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-198",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-198.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-199",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-199.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-200",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-200.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-201",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-201.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-202",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-202.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-203",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-203.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-204",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-204.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-205",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-205.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-206",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-206.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-207",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-207.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-208",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-208.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-209",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-209.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-210",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-210.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-211",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-211.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-212",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-212.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-213",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-213.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-214",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-214.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-215",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-215.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-216",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-216.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-217",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-217.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-218",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-218.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-219",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-219.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-220",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-220.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-221",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-221.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-222",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-222.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-223",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-223.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-224",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-224.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-225",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-225.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-226",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-226.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-227",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-227.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-228",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-228.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-229",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-229.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-230",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-230.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-231",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-231.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-232",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-232.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-233",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-233.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-234",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-234.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-235",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-235.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-236",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-236.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-237",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-237.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-238",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-238.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-239",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-239.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-240",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-240.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-241",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-241.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-242",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-242.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-243",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-243.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-244",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-244.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-245",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-245.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-246",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-246.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-247",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-247.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-248",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-248.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-249",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-249.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-250",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-250.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-251",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-251.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-252",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-252.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-253",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-253.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-254",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-254.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-255",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-255.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-256",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-256.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-257",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-257.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-258",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-258.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-259",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-259.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-260",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-260.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-261",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-261.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-262",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-262.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-263",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-263.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-264",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-264.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-265",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-265.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-266",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-266.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-267",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-267.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-268",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-268.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-269",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-269.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-270",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-270.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-271",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-271.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-272",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-272.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-273",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-273.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-274",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-274.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-275",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-275.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-276",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-276.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-277",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-277.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-278",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-278.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-279",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-279.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-280",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-280.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-281",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-281.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-282",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-282.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-283",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-283.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-284",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-284.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-285",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-285.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-286",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-286.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-287",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-287.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-288",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-288.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-289",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-289.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-290",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-290.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-291",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-291.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-292",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-292.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-293",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-293.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-294",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-294.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-295",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-295.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-296",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-296.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-297",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-297.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-298",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-298.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-299",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-299.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-300",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-300.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-301",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-301.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-302",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-302.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-303",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-303.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-304",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-304.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-305",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-305.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-306",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-306.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-307",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-307.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-308",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-308.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-309",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-309.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-310",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-310.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-311",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-311.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-312",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-312.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-313",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-313.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-314",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-314.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-315",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-315.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-316",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-316.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-317",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-317.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-318",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-318.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-319",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-319.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-320",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-320.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-321",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-321.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-322",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-322.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-323",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-323.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-324",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-324.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-325",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-325.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-326",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-326.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-327",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-327.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-328",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-328.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-329",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-329.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-330",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-330.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-331",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-331.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-332",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-332.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-333",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-333.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-334",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-334.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-335",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-335.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-336",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-336.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-337",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-337.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-338",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-338.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-339",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-339.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-340",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-340.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-341",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-341.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-342",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-342.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-343",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-343.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-344",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-344.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-345",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-345.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-346",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-346.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-347",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-347.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-348",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-348.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-349",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-349.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-350",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-350.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-351",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-351.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-352",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-352.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-353",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-353.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-354",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-354.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-355",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-355.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-356",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-356.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-357",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-357.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-358",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-358.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-359",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-359.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-360",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-360.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-361",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-361.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-362",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-362.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-363",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-363.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-364",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-364.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-365",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-365.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-366",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-366.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-367",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-367.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-368",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-368.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-369",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-369.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-370",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-370.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-371",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-371.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-372",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-372.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-373",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-373.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-374",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-374.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-375",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-375.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-376",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-376.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-377",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-377.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-378",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-378.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-379",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-379.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-380",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-380.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-381",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-381.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-382",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-382.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-383",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-383.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-384",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-384.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-385",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-385.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-386",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-386.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-387",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-387.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-388",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-388.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-389",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-389.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-390",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-390.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-391",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-391.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-392",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-392.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-393",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-393.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-394",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-394.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-395",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-395.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-396",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-396.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-397",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-397.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-398",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-398.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-399",
    filename = NEEDLEPATH .. "airspeed/airspeed_indicator_warning_needle-399.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  { --Warning Speed indicator needles, 400 of them, each at 4km/h intervals
  type = "sprite",
  name = "aircraft-realism-airspeed-indicator-warning-0",
  filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-0.png",
  flags = {"gui"},
  width = 152,
  height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-1",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-1.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-2",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-2.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-3",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-3.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-4",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-4.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-5",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-5.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-6",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-6.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-7",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-7.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-8",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-8.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-9",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-9.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-10",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-10.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-11",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-11.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-12",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-12.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-13",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-13.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-14",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-14.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-15",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-15.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-16",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-16.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-17",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-17.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-18",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-18.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-19",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-19.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-20",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-20.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-21",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-21.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-22",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-22.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-23",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-23.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-24",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-24.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-25",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-25.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-26",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-26.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-27",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-27.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-28",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-28.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-29",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-29.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-30",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-30.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-31",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-31.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-32",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-32.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-33",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-33.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-34",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-34.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-35",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-35.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-36",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-36.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-37",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-37.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-38",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-38.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-39",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-39.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-40",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-40.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-41",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-41.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-42",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-42.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-43",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-43.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-44",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-44.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-45",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-45.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-46",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-46.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-47",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-47.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-48",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-48.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-49",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-49.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-50",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-50.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-51",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-51.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-52",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-52.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-53",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-53.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-54",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-54.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-55",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-55.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-56",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-56.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-57",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-57.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-58",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-58.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-59",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-59.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-60",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-60.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-61",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-61.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-62",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-62.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-63",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-63.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-64",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-64.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-65",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-65.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-66",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-66.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-67",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-67.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-68",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-68.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-69",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-69.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-70",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-70.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-71",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-71.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-72",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-72.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-73",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-73.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-74",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-74.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-75",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-75.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-76",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-76.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-77",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-77.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-78",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-78.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-79",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-79.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-80",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-80.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-81",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-81.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-82",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-82.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-83",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-83.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-84",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-84.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-85",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-85.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-86",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-86.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-87",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-87.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-88",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-88.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-89",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-89.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-90",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-90.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-91",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-91.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-92",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-92.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-93",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-93.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-94",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-94.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-95",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-95.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-96",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-96.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-97",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-97.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-98",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-98.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-99",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-99.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-100",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-100.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-101",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-101.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-102",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-102.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-103",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-103.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-104",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-104.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-105",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-105.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-106",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-106.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-107",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-107.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-108",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-108.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-109",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-109.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-110",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-110.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-111",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-111.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-112",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-112.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-113",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-113.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-114",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-114.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-115",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-115.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-116",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-116.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-117",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-117.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-118",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-118.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-119",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-119.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-120",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-120.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-121",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-121.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-122",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-122.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-123",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-123.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-124",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-124.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-125",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-125.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-126",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-126.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-127",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-127.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-128",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-128.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-129",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-129.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-130",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-130.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-131",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-131.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-132",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-132.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-133",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-133.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-134",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-134.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-135",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-135.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-136",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-136.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-137",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-137.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-138",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-138.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-139",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-139.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-140",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-140.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-141",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-141.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-142",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-142.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-143",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-143.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-144",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-144.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-145",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-145.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-146",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-146.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-147",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-147.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-148",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-148.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-149",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-149.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-150",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-150.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-151",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-151.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-152",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-152.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-153",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-153.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-154",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-154.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-155",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-155.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-156",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-156.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-157",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-157.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-158",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-158.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-159",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-159.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-160",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-160.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-161",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-161.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-162",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-162.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-163",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-163.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-164",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-164.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-165",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-165.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-166",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-166.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-167",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-167.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-168",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-168.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-169",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-169.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-170",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-170.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-171",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-171.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-172",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-172.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-173",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-173.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-174",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-174.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-175",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-175.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-176",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-176.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-177",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-177.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-178",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-178.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-179",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-179.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-180",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-180.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-181",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-181.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-182",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-182.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-183",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-183.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-184",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-184.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-185",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-185.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-186",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-186.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-187",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-187.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-188",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-188.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-189",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-189.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-190",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-190.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-191",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-191.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-192",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-192.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-193",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-193.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-194",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-194.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-195",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-195.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-196",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-196.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-197",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-197.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-198",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-198.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-199",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-199.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-200",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-200.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-201",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-201.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-202",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-202.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-203",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-203.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-204",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-204.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-205",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-205.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-206",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-206.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-207",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-207.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-208",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-208.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-209",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-209.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-210",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-210.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-211",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-211.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-212",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-212.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-213",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-213.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-214",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-214.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-215",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-215.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-216",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-216.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-217",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-217.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-218",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-218.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-219",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-219.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-220",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-220.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-221",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-221.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-222",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-222.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-223",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-223.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-224",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-224.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-225",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-225.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-226",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-226.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-227",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-227.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-228",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-228.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-229",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-229.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-230",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-230.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-231",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-231.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-232",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-232.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-233",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-233.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-234",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-234.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-235",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-235.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-236",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-236.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-237",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-237.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-238",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-238.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-239",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-239.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-240",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-240.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-241",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-241.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-242",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-242.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-243",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-243.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-244",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-244.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-245",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-245.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-246",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-246.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-247",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-247.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-248",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-248.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-249",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-249.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-250",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-250.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-251",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-251.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-252",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-252.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-253",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-253.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-254",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-254.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-255",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-255.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-256",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-256.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-257",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-257.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-258",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-258.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-259",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-259.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-260",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-260.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-261",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-261.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-262",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-262.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-263",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-263.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-264",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-264.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-265",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-265.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-266",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-266.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-267",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-267.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-268",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-268.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-269",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-269.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-270",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-270.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-271",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-271.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-272",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-272.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-273",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-273.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-274",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-274.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-275",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-275.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-276",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-276.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-277",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-277.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-278",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-278.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-279",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-279.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-280",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-280.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-281",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-281.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-282",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-282.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-283",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-283.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-284",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-284.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-285",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-285.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-286",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-286.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-287",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-287.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-288",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-288.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-289",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-289.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-290",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-290.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-291",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-291.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-292",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-292.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-293",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-293.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-294",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-294.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-295",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-295.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-296",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-296.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-297",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-297.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-298",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-298.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-299",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-299.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-300",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-300.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-301",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-301.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-302",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-302.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-303",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-303.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-304",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-304.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-305",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-305.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-306",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-306.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-307",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-307.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-308",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-308.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-309",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-309.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-310",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-310.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-311",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-311.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-312",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-312.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-313",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-313.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-314",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-314.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-315",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-315.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-316",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-316.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-317",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-317.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-318",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-318.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-319",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-319.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-320",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-320.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-321",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-321.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-322",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-322.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-323",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-323.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-324",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-324.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-325",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-325.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-326",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-326.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-327",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-327.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-328",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-328.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-329",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-329.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-330",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-330.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-331",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-331.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-332",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-332.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-333",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-333.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-334",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-334.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-335",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-335.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-336",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-336.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-337",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-337.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-338",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-338.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-339",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-339.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-340",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-340.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-341",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-341.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-342",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-342.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-343",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-343.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-344",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-344.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-345",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-345.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-346",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-346.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-347",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-347.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-348",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-348.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-349",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-349.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-350",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-350.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-351",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-351.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-352",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-352.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-353",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-353.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-354",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-354.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-355",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-355.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-356",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-356.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-357",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-357.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-358",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-358.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-359",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-359.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-360",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-360.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-361",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-361.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-362",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-362.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-363",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-363.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-364",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-364.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-365",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-365.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-366",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-366.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-367",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-367.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-368",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-368.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-369",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-369.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-370",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-370.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-371",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-371.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-372",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-372.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-373",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-373.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-374",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-374.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-375",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-375.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-376",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-376.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-377",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-377.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-378",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-378.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-379",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-379.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-380",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-380.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-381",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-381.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-382",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-382.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-383",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-383.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-384",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-384.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-385",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-385.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-386",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-386.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-387",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-387.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-388",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-388.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-389",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-389.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-390",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-390.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-391",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-391.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-392",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-392.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-393",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-393.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-394",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-394.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-395",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-395.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-396",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-396.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-397",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-397.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-398",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-398.png",
    flags = {"gui"},
    width = 152,
    height = 152
  },
  {
    type = "sprite",
    name = "aircraft-realism-airspeed-indicator-warning-399",
    filename = NEEDLEPATH .. "airspeed_warning/airspeed_indicator_warning_needle-399.png",
    flags = {"gui"},
    width = 152,
    height = 152
  }
})