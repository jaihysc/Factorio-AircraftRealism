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

-- TODO option to disable shadows since this adds a lot of extra sprites
local function makeShadow(config)
    -- Since mod authors may set scale only on top level animation not the shadow animation
    -- we have to ask for scale

    -- Validate config
    if config.name == nil then
        error("Missing table member: name")
    end
    if config.animation == nil then
        error("Missing table member: animation")
    end
    if config.animation_frames == nil then
        error("Missing table member: animation_frames")
    end
    if config.animation_scale == nil then
        error("Missing table member: animation_scale")
    end
    if config.animation_scale.initial == nil then
        error("Missing table member: animation_scale.initial")
    end
    if config.animation_scale.final == nil then
        error("Missing table member: animation_scale.final")
    end
    if config.animation.hr_version then
        if config.hr_animation_scale == nil then
            error("Missing table member: hr_animation_scale")
        end
        if config.hr_animation_scale.initial == nil then
            error("Missing table member: hr_animation_scale.initial")
        end
        if config.hr_animation_scale.final == nil then
            error("Missing table member: hr_animation_scale.final")
        end
    end

    local baseShadow = table.deepcopy(data.raw.car[config.name])
    baseShadow.light = {type="basic", intensity=0, size=1} -- Disable light
    baseShadow.allow_passengers = false
    baseShadow.alert_when_damaged = false
    baseShadow.collision_box = {{0, 0}, {0, 0}}
    baseShadow.collision_mask = {}
    baseShadow.flags = {
        "placeable-off-grid",
        "not-repairable",
        "not-on-map",
        "not-blueprintable",
        "not-deconstructable",
        "hidden",
        "hide-alt-info",
        "not-flammable",
        "no-automated-item-removal",
        "no-automated-item-insertion",
        "not-selectable-in-game",
        "not-in-kill-statistics"
    }
    baseShadow.selection_box = {{0, 0}, {0, 0}}
    baseShadow.water_reflection = nil

    -- Computes the scale for the nth frame
    -- The scale linearily decreases from initial scale to final scale with
    -- -1 |-> initialScale
    -- frames |-> finalScale
    -- First frame starts smaller than intial scale, makes the animation look nicer
    local scale = function(n, initialScale, finalScale)
        return (finalScale - initialScale) * (n+1) / (config.animation_frames) + initialScale
    end

    -- Create the different scales of shadow
    for i=0,config.animation_frames-1,1 do
        local shadow = table.deepcopy(baseShadow)
        shadow.name = config.name .. "-shadow-" .. tostring(i) -- Shadow naming starts from 0

        local anim = table.deepcopy(config.animation)
        anim.scale = scale(i, config.animation_scale.initial, config.animation_scale.final)
        if anim.hr_version then
            anim.hr_version.scale =
                scale(i, config.hr_animation_scale.initial, config.hr_animation_scale.final)
        end

        shadow.animation = anim
        data:extend{shadow}
    end

    return {} -- Returning a table here allows for additional values in future
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
functions.makeShadow = makeShadow
functions.getSettings = getSettings

return functions