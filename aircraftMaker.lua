local functions = {}

local function makeGrounded(config)
    -- Validate config
    if config.prototype == nil then
        error("Missing table member: prototype")
    end

    --
    local plane = config.prototype

    -- Identify the plane by storing a symbol in order
    if plane.order ~= nil then
        plane.order = plane.order .. "-__Z9ZC_G"
    else
        plane.order = "-__Z9ZC_G"
    end

    
    if settings.startup["aircraft-realism-turn-radius"].value then
        plane.tank_driving = false
    end

    if settings.startup["aircraft-realism-takeoff-health"].value then
        plane.max_health = plane.max_health / 2
        -- Account for less health by reducing the repair speed by 2x
        if plane.repair_speed_modifier ~= nil then
            plane.repair_speed_modifier = plane.repair_speed_modifier / 2; 
        else
            plane.repair_speed_modifier = 0.5
        end
    end


    -- Fuel consumption multiplier

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

    local newConsumptionNum = oldConsumptionNum * settings.startup["aircraft-realism-fuel-usage-multiplier-grounded"].value

    -- Add eng unit back
    local newConsumptionStr = tostring(newConsumptionNum) ..
        string.sub(plane.consumption, string.len(plane.consumption) - engUnitLen + 1)

    plane.consumption = newConsumptionStr

    -- Lower the fuel effectivity so the plane handles the same
    plane.effectivity = plane.effectivity / settings.startup["aircraft-realism-fuel-usage-multiplier-grounded"].value
end

local function makeAirborne(config)
    -- Validate config
    if config.name == nil then
        error("Missing table member: name")
    end

    --
    local plane = table.deepcopy(data.raw.car[config.name])

    plane.name  = config.name .. "-airborne" -- Identifies plane, avoids name conflicts
    if plane.order ~= nil then
        plane.order = plane.order .. "-__Z9ZC_A"
    else
        plane.order = "-__Z9ZC_A"
    end

    plane.collision_mask = {}

    if settings.startup["aircraft-realism-takeoff-health"].value then
        plane.max_health = plane.max_health * 2 -- Was divided by 2 in grounded version
    end

    if settings.startup["aircraft-realism-turn-radius"].value then
        plane.tank_driving = false
    end

    -- Fuel consumption multiplier

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

    local newConsumptionNum = oldConsumptionNum * settings.startup["aircraft-realism-fuel-usage-multiplier-airborne"].value

    -- Add eng unit back
    local newConsumptionStr = tostring(newConsumptionNum) ..
        string.sub(plane.consumption, string.len(plane.consumption) - engUnitLen + 1)

    plane.consumption = newConsumptionStr

    -- Lower the fuel effectivity so the same energy goes to the wheels
    plane.effectivity = plane.effectivity / settings.startup["aircraft-realism-fuel-usage-multiplier-airborne"].value


    data:extend{plane}
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