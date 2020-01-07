-- A set of functions which aids the other lua scripts

local function toFactorioUnit(settings, kmH)
    if settings.global["aircraft-speed-unit"].value == "imperial" then
        kmH = kmH * 1.609 --Thanks google!
    end

    -- Convert the lua speed into km/h with * 60 * 3.6
    return kmH / 216
end

-- Converts factorio's speed to km/h or mph per runtime global
local function fromFactorioUnit(settings, unit)
    unit = unit * 216

    if settings.global["aircraft-speed-unit"].value == "imperial" then
        unit = unit / 1.609
    end

    return unit
end

-- Converts factorio's speed to km/h or mph per the user's settings
local function fromFactorioUnitUser(settings, player, unit)
    unit = unit * 216

    if settings.get_player_settings(player)["aircraft-realism-user-speed-unit"].value == "imperial" then
        unit = unit / 1.609
    end

    return unit
end

local function getTableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

local function roundNumber(number)
    if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
      number = number - (number % 1)
    else
      number = (number - (number % 1)) + 1
    end
   return number
  end

-- You have no idea how scared I am writing a new function in Lua after seeing nils from all sorts of places
local function playSound(settings, player, soundName)
    if settings.get_player_settings(player)["aircraft-realism-sounds-enabled"].value then
        player.play_sound({path=soundName})
    end
end
-- Makes these functions available to the lua script which requires this file
local functions = {}

functions.toFactorioUnit = toFactorioUnit
functions.fromFactorioUnit = fromFactorioUnit
functions.fromFactorioUnitUser = fromFactorioUnitUser
functions.getTableLength = getTableLength
functions.roundNumber = roundNumber
functions.playSound = playSound

return functions