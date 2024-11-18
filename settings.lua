local utility = require("logic.utility")
require("support_aircraft.planeSettings")

data:extend({
    {
        type = "bool-setting",
        name = "aircraft-realism-turn-radius",
        setting_type = "startup",
        default_value = true,
        order="aaa"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-acceleration",
        setting_type = "startup",
        default_value = true,
        order="aab"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-braking-speed",
        setting_type = "startup",
        default_value = true,
        order="aac"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-takeoff-health",
        setting_type = "startup",
        default_value = false,
        order="aad"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-fuel-usage-multiplier-grounded",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 2,
        order="aba"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-fuel-usage-multiplier-airborne",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 2.25,
        order="abb"
    },
    { -- RUNTIME SETTINGS
        type = "bool-setting",
        name = utility.S_RUNWAY_REQUIREMENT,
        setting_type = "runtime-global",
        default_value = false,
        order="aca"
    },
    {
        type = "double-setting",
        name = utility.S_RUNWAY_MAX_FRICTION,
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 0.9,
        order="acb"
    },
    {
        type = "double-setting",
        name = utility.S_RUNWAY_TAXI_SPEED,
        setting_type = "runtime-global",
        minimum_value = 1,
        default_value = 35,
        order="acc"
    },
    {
        type = "bool-setting",
        name = utility.S_EMIT_POLLUTION,
        setting_type = "runtime-global",
        default_value = false,
        order="acd"
    },
    {
        type = "double-setting",
        name = utility.S_POLLUTION_AMOUNT,
        setting_type = "runtime-global",
        minimum_value = 0,
        maximum_value = 1000,
        default_value = 0.1,
        order="ace"
    },
    {
        type = "bool-setting",
        name = utility.S_ENV_IMPACT,
        setting_type = "runtime-global",
        default_value = false,
        order="acf"
    },
    {
        type = "bool-setting",
        name = utility.S_AIRBORNE_DAMAGE_IMMUNITY,
        setting_type = "runtime-global",
        default_value = false,
        order="acg"
    },
    {
        type = "string-setting",
        name = utility.S_SPEED_UNIT,
        setting_type = "runtime-global",
        default_value = "km/h",
        allowed_values = {
            "km/h",
            "mile/h"
        },
        allow_blank = false,
        order="ach"
    }, -- Per user settings
    {
        type = "bool-setting",
        name = utility.SU_ENABLE_GAUGES,
        setting_type = "runtime-per-user",
        default_value = true,
        order="aba"
    },
    {
        type = "string-setting",
        name = utility.SU_SPEED_UNIT,
        setting_type = "runtime-per-user",
        default_value = "km/h",
        allowed_values = {
            "km/h",
            "mile/h"
        },
        allow_blank = false,
        order="abb"
    },
    {
        type = "int-setting",
        name = utility.SU_LOW_FUEL_WARN_THRESHOLD,
        setting_type = "runtime-per-user",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 10,
        order="abc"
    },
    {
        type = "bool-setting",
        name = utility.SU_LOW_FUEL_WARN,
        setting_type = "runtime-per-user",
        default_value = true,
        order="abd"
    }
})
