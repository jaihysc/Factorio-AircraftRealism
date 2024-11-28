-- A set of functions which aids the other lua scripts

local utility = {}

local PDH_PROTOTYPE = "fish" -- Plane Data Holder
local PDH_NAME_PREFIX = "aircraft-realism-plane-properties-"
local PDH_SEGMENT_LEN = 200

utility.KPH2MPT                        = 1000 / (60 * 60 * 60) -- km/h * KPH2MPT = m/tick

-- Settings (S), User Settings (SU)
utility.S_AIRBORNE_DAMAGE_IMMUNITY     = "aircraft-realism-airborne-damage-immunity"
utility.S_ENV_IMPACT                   = "aircraft-realism-environmental-impact"
utility.S_SPEED_UNIT                   = "aircraft-speed-unit"

utility.S_EMIT_POLLUTION               = "aircraft-emit-pollution"
utility.S_POLLUTION_AMOUNT             = "aircraft-pollution-amount"

utility.S_RUNWAY_MAX_FRICTION          = "aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction"
utility.S_RUNWAY_REQUIREMENT           = "aircraft-realism-strict-runway-checking"
utility.S_RUNWAY_TAXI_SPEED            = "aircraft-realism-strict-runway-max-taxi-speed"

utility.SU_ENABLE_GAUGES               = "aircraft-realism-user-enable-gauges"
utility.SU_LOW_FUEL_WARN               = "aircraft-realism-sounds-enabled"
utility.SU_LOW_FUEL_WARN_THRESHOLD     = "aircraft-realism-user-low-fuel-warning-percentage"
utility.SU_SPEED_UNIT                  = "aircraft-realism-user-speed-unit"

utility.UI_GAUGE_FRAME                 = "aircraft-realism-gauge-frame"
utility.UI_FUEL_FRAME                  = "aircraft-realism-fuel-indicator"
utility.UI_FUEL_FRAME_SPRITE           = "aircraft-realism-fuel-indicator-base"
utility.UI_SPEED_FRAME                 = "aircraft-realism-airspeed-indicator"
utility.UI_SPEED_FRAME_SPRITE          = "aircraft-realism-airspeed-indicator-base"

utility.UI_FUELW                       = "aircraft-realism-fuel-indicator-emergency-fuel-warning"
utility.UI_FUELW_SPRITE                = "aircraft-realism-fuel-indicator-emergency-fuel-warning"
utility.UI_FUEL_L_NEEDLE               = "aircraft-realism-fuel-indicator-left-bar"
utility.UI_FUEL_L_NEEDLE_SPRITE_PREFIX = "aircraft-realism-fuel-indicator-left-"
utility.UI_FUEL_L_NEEDLE_COUNT         = 32
utility.UI_FUEL_R_NEEDLE               = "aircraft-realism-fuel-indicator-right-bar"
utility.UI_FUEL_R_NEEDLE_SPRITE_PREFIX = "aircraft-realism-fuel-indicator-right-"
utility.UI_FUEL_R_NEEDLE_COUNT         = 31

utility.UI_SPEED_NEEDLE                = "aircraft-realism-airspeed-indicator-needle"
utility.UI_SPEEDW_NEEDLE               = "aircraft-realism-airspeed-indicator-warning-needle"
utility.UI_SPEED_NEEDLE_SPRITE_PREFIX  = "aircraft-realism-airspeed-indicator-"
utility.UI_SPEEDW_NEEDLE_SPRITE_PREFIX = "aircraft-realism-airspeed-indicator-warning-"
utility.UI_SPEED_NEEDLE_COUNT          = 400

utility.UI_WARNING_SOUND               = "aircraft-realism-sound-master-warning"

utility.UI_SHOW_TAKEOFF_DIST           = "aircraft-realism-show-takeoff-distance"

-- Converts speed from settings to m/tick
local function toFactorioUnit(speed)
    assert(speed)
    -- MPH -> km/h
    if settings.global[utility.S_SPEED_UNIT].value == "mile/h" then
        speed = speed * 1.609
    end
    -- km/h -> m/tick
    return speed * utility.KPH2MPT
end

-- Converts m/tick to km/h or mph per the user's settings
local function fromFactorioUnitUser(player, mpt)
    assert(player)
    assert(mpt)
    -- m/tick -> km/h
    local speed = mpt / utility.KPH2MPT

    -- km/h -> MPH
    if settings.get_player_settings(player)[utility.SU_SPEED_UNIT].value == "mile/h" then
        speed = speed / 1.609
    end
    return speed
end

local function getTableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
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

-- Plane data handling

--[[
    We do some trickery to save data between the data and control stages
    Serialize the data and store it in a prototype's property "order"
    The prototype propety can store a max of 200 characters, thus we split it across several prototypes and recombine the string

    The plane data table
    {
        grounded = {
            "grounded-plane-name1"=1, -- Number is index into table "data"
            "grounded-plane-name2"=2,
            -- ...
        },
        airborne = {
            "airborne-plane-name1"=2,
            "airborne-plane-name2"=1,
            -- ...
        },
        data = {
            -- Lookup plane in grounded or airborne table for index into data table
            {
                -- Data for plane 1 (plane config)...
                transitionSpeedSetting: string
                groundedName:           string
                airborneName:           string
                maxSpeed:               number
                shadowSprite            table {string}
                shadowEndSpeed          number
                shadowOffset            table {number, number}
                shadowLayer             string
                shadowAlpha             number
            },
            {
                -- Data for plane 2 (plane config)...
            },
            -- ...
        }
    }
    In the example above, grounded-plane-name1 and airborne-plane-name2 are linked together, with their data stored at index 1
]]

local planeDataCache = nil -- Cache plane data here during runtime

-- Fetches table holding information about all the planes
local function getPlaneData()
    if planeDataCache ~= nil then
        return planeDataCache
    end

    -- Recreate the serialized data by iterating all the prototypes
    local serializedData = ""
    local prototypeIdx = 0
    while true do
        local planeDataHolder = nil
        if data then
            -- Data stage
            planeDataHolder = data.raw[PDH_PROTOTYPE][PDH_NAME_PREFIX .. tostring(prototypeIdx)]
        else
            -- Control stage
            planeDataHolder = prototypes.entity[PDH_NAME_PREFIX .. tostring(prototypeIdx)]
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
        planeData = {
            grounded = {},
            airborne = {},
            data     = {}
        }
    else
        local status, data = serpent.load(serializedData)
        assert(status)
        planeData = data
    end
    assert(planeData)

    -- Cache the data during runtime
    if not data then
        planeDataCache = planeData;
    end
    return planeData
end

-- Saves plane data table, can only be used during data stage!
local function savePlaneData(planeData)
    assert(planeData)
    local serializedData = serpent.dump(planeData)
    -- Store the data into the prototypes, split it because of string limits per prototype
    prototypeIdx = 0
    for i=1, string.len(serializedData), PDH_SEGMENT_LEN  do
        local planeDataHolder = data.raw[PDH_PROTOTYPE][PDH_NAME_PREFIX .. tostring(prototypeIdx)]
        if planeDataHolder == nil then
            -- Create if non existent
            data:extend{{
                name=PDH_NAME_PREFIX .. tostring(prototypeIdx),
                type=PDH_PROTOTYPE,
                order="",
            }}
            planeDataHolder = data.raw[PDH_PROTOTYPE][PDH_NAME_PREFIX .. tostring(prototypeIdx)]
            assert(planeDataHolder)
        end
        -- Store a fixed length segment of the string
        planeDataHolder.order = string.sub(serializedData, i, i - 1 + PDH_SEGMENT_LEN)
        prototypeIdx = prototypeIdx + 1
    end
end

-- Fetches table holding data for given plane
local function getPlaneConfig(name)
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

-- Plane config functions for convenience

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
    local speedSettingName = getPlaneConfig(name).transitionSpeedSetting
    local speedSetting = settings.global[speedSettingName]
    assert(speedSetting, "Could not find transition speed for \"" .. speedSettingName .. "\", check the setting name is spelled correctly and setting type is runtime-global")
    return toFactorioUnit(speedSetting.value)
end

utility.toFactorioUnit = toFactorioUnit
utility.fromFactorioUnitUser = fromFactorioUnitUser
utility.getTableLength = getTableLength
utility.orientationToIdx = orientationToIdx
utility.initPlaneData = initPlaneData
utility.getPlaneData = getPlaneData
utility.savePlaneData = savePlaneData
utility.getPlaneConfig = getPlaneConfig
utility.isGroundedPlane = isGroundedPlane
utility.isAirbornePlane = isAirbornePlane
utility.isPlane = isPlane
utility.getTransitionSpeed = getTransitionSpeed

return utility