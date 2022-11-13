local utility = require("logic.utility")
local functions = {}

-- Stores runtime information about planes
-- airborne: true if is airborne plane, false if grounded
-- setupData: Function accepting table, modifies the data about current plane in the plane data table
--            nil if not used
local function setupRuntimeInfo(groundedName, airborneName, airborne, setupData)
    local planeData = utility.getPlaneData(true)

    -- Manipulate data
    local dataIdx = 0
    if airborne then
        if planeData.grounded[groundedName] then
            -- Already created grounded plane, save data using its index
            dataIdx = planeData.grounded[groundedName]
        else
            table.insert(planeData.data, {})
            dataIdx = utility.getTableLength(planeData.data)
        end
        planeData.airborne[airborneName] = dataIdx
    else
        if planeData.airborne[airborneName] then
            -- Already created airborne plane, save data using its index
            dataIdx = planeData.airborne[airborneName]
        else
            table.insert(planeData.data, {})
            dataIdx = utility.getTableLength(planeData.data)
        end
        planeData.grounded[groundedName] = dataIdx
    end
    if setupData then
        setupData(planeData.data[dataIdx])
    end

    utility.savePlaneData(planeData)
end

-- Adjusts health of plane for increased damage
local function setupHealth(plane)
    if settings.startup["aircraft-realism-takeoff-health"].value then
        plane.max_health = plane.max_health / 2
        -- Account for less health by reducing the repair speed by 2x
        if plane.repair_speed_modifier ~= nil then
            plane.repair_speed_modifier = plane.repair_speed_modifier / 2; 
        else
            plane.repair_speed_modifier = 0.5
        end
    end
end

local function setupHandling(plane)
    if settings.startup["aircraft-realism-turn-radius"].value then
        plane.tank_driving = false
    end
end

-- Setup fuel consumption multiplier
-- airborne: true if is airborne plane, false if grounded
local function setupFuelConsumption(plane, airborne)
    local multiplier = settings.startup["aircraft-realism-fuel-usage-multiplier-grounded"].value
    if airborne then
        multiplier = settings.startup["aircraft-realism-fuel-usage-multiplier-airborne"].value
    end

    -- Get eng unit len of consumption
    local engUnitLen = 0
    for i=string.len(plane.consumption), 1, -1 do
        if tonumber(string.sub(plane.consumption, i, i)) ~= nil then
            break
        end
        engUnitLen = engUnitLen + 1
    end

    -- Multiply consumption
    local oldConsumptionNum = tonumber(
        string.sub(plane.consumption, 1, string.len(plane.consumption) - engUnitLen)
    )

    local newConsumptionNum = oldConsumptionNum * multiplier

    -- Add eng unit back
    local newConsumptionStr = tostring(newConsumptionNum) ..
        string.sub(plane.consumption, string.len(plane.consumption) - engUnitLen + 1)

    plane.consumption = newConsumptionStr

    -- Lower the fuel effectivity so the plane handles the same
    plane.effectivity = plane.effectivity / multiplier
end

local function makeGrounded(config)
    -- Validate config
    if config.prototype == nil then
        error("Missing table member: prototype")
    end

    local plane = config.prototype

    setupRuntimeInfo(plane.name, plane.name .. utility.AIRBORNE_PLANE_SUFFIX, false)
    setupHealth(plane)
    setupHandling(plane)
    setupFuelConsumption(plane, false)
end

local function makeAirborne(config)
    -- Validate config
    if config.name == nil then
        error("Missing table member: name")
    end

    if config.shadow then
        if config.shadow.filename == nil then
            error("Missing shadow table member: filename")
        end
        if config.shadow.width == nil then
            error("Missing shadow table member: width")
        end
        if config.shadow.height == nil then
            error("Missing shadow table member: height")
        end
        if config.shadow.lineLength == nil then
            error("Missing table member: lineLength")
        end
        if config.shadow.directionCount == nil then
            error("Missing table member: directionCount")
        end
        if config.shadow.shift == nil then
            config.shadow.shift = {0, 0}
        end
        if config.shadow.scale == nil then
            config.shadow.scale = 1
        end
    end

    setupRuntimeInfo(config.name, config.name .. utility.AIRBORNE_PLANE_SUFFIX, true, function(data)
        assert(data.shadow == nil, "Plane already has shadow data, did you call makeAirborne twice?")
        data.shadow = {}
        data.shadow.endSpeed = 180 / 216
        data.shadow.tileOffsetFinal = {50, 20}
        data.shadow.renderLayer = "smoke" -- Layer right below air-object
        data.shadow.alphaInitial = 0.5
        data.shadow.totalFrames = 36
    end)

    local plane = table.deepcopy(data.raw.car[config.name])
    plane.name  = config.name .. utility.AIRBORNE_PLANE_SUFFIX

    plane.collision_mask = {}
    setupHealth(plane)
    setupHandling(plane)
    setupFuelConsumption(plane, true)
    data:extend{plane}


    -- Shadow creation
    if config.shadow then
        -- Load each rotation as its own sprite, so it can be rendered
        for i=0,config.shadow.directionCount-1,1  do
            local xPos = i % config.shadow.lineLength
            local yPos = math.floor(i / config.shadow.lineLength)
            data:extend{{
                type = "sprite",
                name = config.name .. "-airborne-shadow-" .. tostring(i),
                filename = config.shadow.filename,
                width = config.shadow.width,
                height = config.shadow.height,
                x = xPos * config.shadow.width,
                y = yPos * config.shadow.height,
                shift = config.shadow.shift,
                scale = config.shadow.scale,
                -- TODO document that draw_as_shadow puts the shadow on the wrong layer - below the entities
            }}
        end
    end
    return plane
end

local function getSettings()
    return {
        noAerialShadow = settings.startup["aircraft-realism-no-aerial-shadows"].value,
        rAcceleration = settings.startup["aircraft-realism-acceleration"].value,
        rBraking      = settings.startup["aircraft-realism-braking-speed"].value,
        rTurnRadius   = settings.startup["aircraft-realism-turn-radius"].value
    }
end

functions.makeGrounded = makeGrounded
functions.makeAirborne = makeAirborne
functions.getSettings = getSettings

return functions