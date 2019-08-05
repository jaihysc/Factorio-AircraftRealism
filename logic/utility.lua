--A set of functions which aids the other lua scripts

local function toFactorioUnit(settings, kmH)
    if settings.global["aircraft-speed-unit"].value == "imperial" then
        kmH = kmH * 1.609 --Thanks google!
    end

    --Convert the lua speed into km/h with * 60 * 3.6
    return kmH / 216
end

local function getTableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

--Makes these functions available to the lua script which requires this file
local functions = {}

functions.toFactorioUnit = toFactorioUnit
functions.getTableLength = getTableLength


return functions