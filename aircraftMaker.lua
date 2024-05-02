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
local function setupHealth(plane, airborne)
    if settings.startup["aircraft-realism-takeoff-health"].value then
        if airborne then
            plane.max_health = plane.max_health * 2 -- Was divided by 2 in grounded version
        else
            plane.max_health = plane.max_health / 2
            -- Account for less health by reducing the repair speed by 2x
            if plane.repair_speed_modifier ~= nil then
                plane.repair_speed_modifier = plane.repair_speed_modifier / 2
            else
                plane.repair_speed_modifier = 0.5
            end
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
    if config.isSeaplane == nil then
        config.isSeaplane = false
    end

    local plane = config.prototype

    setupRuntimeInfo(plane.name, plane.name .. utility.AIRBORNE_PLANE_SUFFIX, false, function(data)
        data.isSeaplane = config.isSeaplane
    end)
    setupHealth(plane, false)
    setupHandling(plane)
    setupFuelConsumption(plane, false)
end

local function makeAirborne(config)
    -- Validate config
    if config.name == nil then
        error("Missing table member: name")
    end

    if config.shadow then
        if config.shadow.directionCount == nil then
            error("Missing table member: directionCount")
        end
        if config.shadow.endSpeed == nil then
            error("Missing table member: endSpeed")
        end
        if config.shadow.tileOffsetFinal == nil then
            config.shadow.tileOffsetFinal = {50, 20}
        end
        if config.shadow.renderLayer == nil then
            config.shadow.renderLayer = "smoke" -- Layer right below air-object
        end
        if config.shadow.alphaInitial == nil then
            config.shadow.alphaInitial = 0.5
        end

        -- Shadow sprite information required if not manual mode
        if config.shadow.filename ~= nil then
            if config.shadow.lineLength == nil then
                error("Missing table member: lineLength")
            end

            if config.shadow.width == nil then
                error("Missing shadow table member: width")
            end
            if config.shadow.height == nil then
                error("Missing shadow table member: height")
            end
            if config.shadow.shift == nil then
                config.shadow.shift = {0, 0}
            end
            if config.shadow.scale == nil then
                config.shadow.scale = 1
            end

            -- HR properties are required if hr filename provided
            if config.shadow.hrFilename ~= nil then
                if config.shadow.hrWidth == nil then
                    error("Missing shadow table member: hrWidth")
                end
                if config.shadow.hrHeight == nil then
                    error("Missing shadow table member: hrHeight")
                end
                if config.shadow.hrShift == nil then
                    config.shadow.hrShift = {0, 0}
                end
                if config.shadow.hrScale == nil then
                    config.shadow.hrScale = 1
                end
            else
                -- Should not provide HR properties otherwise
                if config.shadow.hrWidth ~= nil then
                    error("Cannot use shadow table member as HR filename not provided: hrWidth")
                end
                if config.shadow.hrHeight ~= nil then
                    error("Cannot use shadow table member as HR filename not provided: hrHeight")
                end
                if config.shadow.hrShift ~= nil then
                    error("Cannot use shadow table member as HR filename not provided: hrShift")
                end
                if config.shadow.hrScale ~= nil then
                    error("Cannot use shadow table member as HR filename not provided: hrScale")
                end
            end
        end
    end

    setupRuntimeInfo(config.name, config.name .. utility.AIRBORNE_PLANE_SUFFIX, true, function(data)
        data.maxSpeed = config.maxSpeed
        if config.shadow then
            assert(data.shadow == nil, "Plane already has shadow data, did you call makeAirborne twice?")
            data.shadow = {}
            data.shadow.endSpeed = config.shadow.endSpeed
            data.shadow.tileOffsetFinal = config.shadow.tileOffsetFinal
            data.shadow.renderLayer = config.shadow.renderLayer
            data.shadow.alphaInitial = config.shadow.alphaInitial
            data.shadow.directionCount = config.shadow.directionCount
        end
    end)

    local plane = table.deepcopy(data.raw.car[config.name])
    plane.name  = config.name .. utility.AIRBORNE_PLANE_SUFFIX

    plane.collision_mask = {}
    setupHealth(plane, true)
    setupHandling(plane)
    setupFuelConsumption(plane, true)
    data:extend{plane}


    -- Shadow creation
    if config.shadow and config.shadow.filename ~= nil then
        -- Load each rotation as its own sprite, so it can be rendered
        for i=0,config.shadow.directionCount-1,1  do
            local xPos = i % config.shadow.lineLength
            local yPos = math.floor(i / config.shadow.lineLength)

            local sprite = {
                type = "sprite",
                name = config.name .. "-airborne-shadow-" .. tostring(i),
                filename = config.shadow.filename,

                width = config.shadow.width,
                height = config.shadow.height,
                x = xPos * config.shadow.width,
                y = yPos * config.shadow.height,
                shift = config.shadow.shift,
                scale = config.shadow.scale,
                -- draw_as_shadow puts the shadow on the wrong layer - below the entities
            }
            if config.shadow.hrFilename then
                sprite.hr_version = {
                    filename = config.shadow.hrFilename,

                    width = config.shadow.hrWidth,
                    height = config.shadow.hrHeight,
                    x = xPos * config.shadow.hrWidth,
                    y = yPos * config.shadow.hrHeight,
                    shift = config.shadow.hrShift,
                    scale = config.shadow.hrScale,
                }
            end
            data:extend{sprite}
        end
    end
    return plane
end

local function getSettings()
    return {
        -- Planes should always have no aerial shadows, otherwise animated
        -- shadows look funny as there are 2 shadows
        noAerialShadow = true, -- Kept true for backward compatibility
        rAcceleration = settings.startup["aircraft-realism-acceleration"].value,
        rBraking      = settings.startup["aircraft-realism-braking-speed"].value,
        rTurnRadius   = settings.startup["aircraft-realism-turn-radius"].value
    }
end

functions.makeGrounded = makeGrounded
functions.makeAirborne = makeAirborne
functions.getSettings = getSettings

return functions