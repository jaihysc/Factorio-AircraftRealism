local utility = require("logic.utility")

local function registerPlane(config)
    -- Default values for inputs
    if not config.max_speed then
        config.max_speed = 1000000 -- No max speed
    end
    if not config.shadow_sprite then
        config.shadow_sprite = {}
    end
    if not config.shadow_end_speed then
        config.shadow_end_speed = 10 * utility.KPH2MPT
    end
    if not config.shadow_offset then
        config.shadow_offset = {50, 20}
    end
    if not config.shadow_layer then
        config.shadow_layer = "smoke" -- Layer right below air-object
    end
    if not config.shadow_alpha then
        config.shadow_alpha = 0.5
    end

    -- Input checking
    local template = {}
    template.transition_speed_setting = ""
    template.grounded_name = ""
    template.airborne_name = ""
    template.max_speed = 0
    template.shadow_sprite = {}
    template.shadow_end_speed = 0
    template.shadow_offset = {}
    template.shadow_layer = ""
    template.shadow_alpha = 0

    for key, val in pairs(template) do
        assert(config[key], "Missing config option \"" .. key .. "\"")
    end
    for key, val in pairs(config) do
        assert(template[key], "Invalid config option \"" .. key .. "\"")
        assert(type(template[key]) == type(val), "Invalid type for config option \"" .. key .. "\" got \"" .. type(val) .. "\" expected \"" .. type(template[key]) .. "\"")
    end

    local shadowSpriteLen = utility.getTableLength(config.shadow_sprite)
    for key, val in pairs(config.shadow_sprite) do
        assert(key > 0, "Invalid config option \"shadow_sprite\" lua arrays indices start at 1")
        assert(key <= shadowSpriteLen, "Invalid config option \"shadow_sprite\" lua arrays indices end at size of array")
        assert(type(val) == "string", "Invalid config option \"shadow_sprite\" element type expected \"string\"")
    end
    assert(#config.shadow_offset == 2, "Invalid config option \"shadow_offset\" expected length 2 array")
    assert(type(config.shadow_offset[1]) == "number", "Invalid config option \"shadow_offset\" element 1 type expected \"number\"")
    assert(type(config.shadow_offset[2]) == "number", "Invalid config option \"shadow_offset\" element 2 type expected \"number\"")

    -- Add the plane config entry into plane data
    local groundedName = config.grounded_name
    local airborneName = config.airborne_name
    local planeData = utility.getPlaneData(true)

    local dataIdx = 0
    if planeData.grounded[groundedName] then
        -- Already created grounded plane, save data using its index
        dataIdx = planeData.grounded[groundedName]
    else
        table.insert(planeData.data, {})
        dataIdx = utility.getTableLength(planeData.data)
    end
    planeData.airborne[airborneName] = dataIdx

    if planeData.airborne[airborneName] then
        -- Already created airborne plane, save data using its index
        dataIdx = planeData.airborne[airborneName]
    else
        table.insert(planeData.data, {})
        dataIdx = utility.getTableLength(planeData.data)
    end
    planeData.grounded[groundedName] = dataIdx

    -- Set the plane config
    local planeConfig = planeData.data[dataIdx]
    planeConfig.transitionSpeedSetting = config.transition_speed_setting
    planeConfig.groundedName = config.grounded_name
    planeConfig.airborneName = config.airborne_name
    planeConfig.maxSpeed = config.max_speed
    planeConfig.shadowSprite = config.shadow_sprite
    planeConfig.shadowEndSpeed = config.shadow_end_speed
    planeConfig.shadowOffset = config.shadow_offset
    planeConfig.shadowLayer = config.shadow_layer
    planeConfig.shadowAlpha = config.shadow_alpha

    utility.savePlaneData(planeData)
end

local functions = {}
functions.register_plane = registerPlane
return functions