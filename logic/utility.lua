-- A set of functions which aids the other lua scripts

local function toFactorioUnit(settings, kmH)
    if settings.global["aircraft-speed-unit"].value == "imperial" then
        kmH = kmH * 1.609
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

local function playSound(settings, player, soundName)
    if settings.get_player_settings(player)["aircraft-realism-sounds-enabled"].value then
        player.play_sound({path=soundName})
    end
end

-- Information is stored in the prototype order on whether or not it is a plane
local function isGroundedPlane(order)
    local suffix = "-__Z9ZC_G"
    return order:sub(-string.len(suffix)) == suffix
end

local function isAirbornePlane(order)
    local suffix = "-__Z9ZC_A"
    return order:sub(-string.len(suffix)) == suffix
end

local function isPlane(order)
    return isGroundedPlane(order) or isAirbornePlane(order)
end

-- Fetches plane takeoff speed in factorio units
-- planeName: grounded plane name
local function getTakeoffSpeed(planeName)
    assert(planeName)
    return toFactorioUnit(settings, settings.global["aircraft-takeoff-speed-" .. planeName].value)
end

-- Fetches plane landing speed in factorio units
-- planeName: grounded plane name
local function getLandingSpeed(planeName)
    assert(planeName)
    return toFactorioUnit(settings, settings.global["aircraft-landing-speed-" .. planeName].value)
end

local function killDriverAndPassenger(plane, player)
    local driver = plane.get_driver()

    -- get_driver() and get_passenger() returns LuaPlayer OR LuaEntity
    -- die() only exists for LuaEntity
    if driver and not driver.is_player() then
        driver.die(player.force, plane)
    end

    local passenger = plane.get_passenger()
    if passenger and not passenger.is_player() then
        passenger.die(player.force, plane)
    end

    plane.die()
end

local functions = {}

functions.toFactorioUnit = toFactorioUnit
functions.fromFactorioUnit = fromFactorioUnit
functions.fromFactorioUnitUser = fromFactorioUnitUser
functions.getTableLength = getTableLength
functions.roundNumber = roundNumber
functions.playSound = playSound
functions.isGroundedPlane = isGroundedPlane
functions.isAirbornePlane = isAirbornePlane
functions.isPlane = isPlane
functions.getTakeoffSpeed = getTakeoffSpeed
functions.getLandingSpeed = getLandingSpeed
functions.killDriverAndPassenger = killDriverAndPassenger

return functions