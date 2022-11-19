-- A set of functions which aids the other lua scripts

local utility = {}

-- Constants
utility.PLANE_DATA_HOLDER_PROTOTYPE = "flying-text"
utility.PLANE_DATA_HOLDER_NAME = "aircraft-realism-plane-properties"
utility.AIRBORNE_PLANE_SUFFIX = "-airborne" -- Suffix added to airborne planes
-- Number of segments to split the serialized data into when saving,
-- as Factorio prototype properties have fixed lengths
utility.PLANE_DATA_SEGMENT_LEN = 200

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

-- Maps RealOrientation to a number between [0, upper), obeying orthogonal projection
-- The resulting number can be used to select the appropriate sprite to represent that orientation
local function orientationToIdx(orientation, upper)
    assert(orientation)
    assert(upper)
	orientation = orientation + 0.25
	local x = math.sin(orientation * math.pi * 2)
	local y = -math.cos(orientation * math.pi * 2)
	y = y * math.cos(math.pi / 4)
	local deprojectedOrientation = (math.atan2(x, -y) / (math.pi * 2)) - 0.25
	return math.floor((deprojectedOrientation * upper) + 0.5) % upper
end

local function playSound(settings, player, soundName)
    if settings.get_player_settings(player)["aircraft-realism-sounds-enabled"].value then
        player.play_sound({path=soundName})
    end
end

-- Returns initialized table holding information about all the planes (to be stored somewhere)
-- See Docs/ScriptImplementation for description of the table
local function initPlaneData()
    return {
        grounded={},
        airborne={},
        data={}
    }
end

-- Fetches table holding information about all the planes
-- dataStage: true if called from dataStage, false/nil if from runtime
local function getPlaneData(dataStage)
    -- We do some trickery to save data until the data stage
    -- Serialize table (data) and store it in a prototype's property order
    -- The prototype propety can store a max of 200 characters, thus we split it across several prototypes

    -- Recreate the serialized data by iterating all the prototypes
    local serializedData = ""
    local prototypeIdx = 0
    while true do
        local planeDataHolder = nil
        if dataStage then
            planeDataHolder = data.raw[utility.PLANE_DATA_HOLDER_PROTOTYPE][utility.PLANE_DATA_HOLDER_NAME .. tostring(prototypeIdx)]
        else
            planeDataHolder = game.entity_prototypes[utility.PLANE_DATA_HOLDER_NAME .. tostring(prototypeIdx)]
        end

        if planeDataHolder == nil then
            break
        end
        serializedData = serializedData .. planeDataHolder.order
        prototypeIdx = prototypeIdx + 1
    end

    -- Deserialize
    if prototypeIdx == 0 then
        -- No data stored yet
        planeData = utility.initPlaneData()
    else
        local status, data = serpent.load(serializedData)
        assert(status)
        planeData = data
    end
    assert(planeData)

    return planeData
end

-- Saves plane data table, can only be used during data stage!
local function savePlaneData(planeData)
    assert(planeData)
    local serializedData = serpent.dump(planeData)
    -- Store the data into the prototypes, split it because of string limits per prototype
    prototypeIdx = 0
    for i=1, string.len(serializedData), utility.PLANE_DATA_SEGMENT_LEN  do
        local planeDataHolder = data.raw[utility.PLANE_DATA_HOLDER_PROTOTYPE][utility.PLANE_DATA_HOLDER_NAME .. tostring(prototypeIdx)]
        if planeDataHolder == nil then
            -- Create if non existent
            data:extend{{
                name=utility.PLANE_DATA_HOLDER_NAME .. tostring(prototypeIdx),
                type=utility.PLANE_DATA_HOLDER_PROTOTYPE,
                order="",
                speed=1,
                time_to_live=1
            }}
            planeDataHolder = data.raw[utility.PLANE_DATA_HOLDER_PROTOTYPE][utility.PLANE_DATA_HOLDER_NAME .. tostring(prototypeIdx)]
            assert(planeDataHolder)
        end
        -- Store a fixed length segment of the string
        planeDataHolder.order = string.sub(serializedData, i, i - 1 + utility.PLANE_DATA_SEGMENT_LEN)
        prototypeIdx = prototypeIdx + 1
    end
end

-- Fetches table holding data for given plane
local function getData(name)
    assert(name)
    local planeData = getPlaneData()

    local idx = planeData.grounded[name]
    if idx ~= nil then
        return planeData.data[idx]
    end
    idx = planeData.airborne[name]
    if idx ~= nil then
        return planeData.data[idx]
    end

    assert(false, "Failed to find data for plane")
end

-- Information is stored in the prototype order on whether or not it is a plane
local function isGroundedPlane(name)
    assert(name)
    return getPlaneData().grounded[name] ~= nil
end

local function isAirbornePlane(name)
    assert(name)
    return getPlaneData().airborne[name] ~= nil
end

local function isPlane(name)
    assert(name)
    return isGroundedPlane(name) or isAirbornePlane(name)
end

-- Fetches plane takeoff/landing speed straight from settings in factorio units
local function getTransitionSpeed(name)
    assert(name)
    local speed = 0
    if isGroundedPlane(name) then
        speed = settings.global["aircraft-takeoff-speed-" .. name].value
    elseif isAirbornePlane(name) then
        -- Chop off the -airborne at the end
        speed = settings.global["aircraft-takeoff-speed-" .. string.sub(name, 0, string.len(name) - string.len(utility.AIRBORNE_PLANE_SUFFIX))].value
    end
    return toFactorioUnit(settings, speed)
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

utility.toFactorioUnit = toFactorioUnit
utility.fromFactorioUnit = fromFactorioUnit
utility.fromFactorioUnitUser = fromFactorioUnitUser
utility.getTableLength = getTableLength
utility.roundNumber = roundNumber
utility.orientationToIdx = orientationToIdx
utility.playSound = playSound
utility.initPlaneData = initPlaneData
utility.getPlaneData = getPlaneData
utility.savePlaneData = savePlaneData
utility.getData = getData
utility.isGroundedPlane = isGroundedPlane
utility.isAirbornePlane = isAirbornePlane
utility.isPlane = isPlane
utility.getTransitionSpeed = getTransitionSpeed
utility.killDriverAndPassenger = killDriverAndPassenger

return utility