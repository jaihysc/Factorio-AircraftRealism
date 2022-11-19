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
        default_value = false,
        order="aab"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-braking-speed",
        setting_type = "startup",
        default_value = false,
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
        name = "aircraft-realism-strict-runway-checking",
        setting_type = "runtime-global",
        default_value = false,
        order="aca"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 0.8,
        order="acb"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-strict-runway-max-taxi-speed",
        setting_type = "runtime-global",
        minimum_value = 1,
        default_value = 35,
        order="acc"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-environmental-impact",
        setting_type = "runtime-global",
        default_value = false,
        order="ace"
    },
    {
        type = "bool-setting",
        name = "aircraft-emit-pollution",
        setting_type = "runtime-global",
        default_value = false,
        order="acf"
    },
    {
        type = "double-setting",
        name = "aircraft-pollution-amount",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 0.1,
        order="acg"
    },
    {
        type = "string-setting",
        name = "aircraft-speed-unit",
        setting_type = "runtime-global",
        default_value = "metric",
        allowed_values = {
            "metric",
            "imperial"
        },
        allow_blank = false,
        order="ach"
    }, -- Per user settings
    {
        type = "bool-setting",
        name = "aircraft-realism-user-enable-gauges",
        setting_type = "runtime-per-user",
        default_value = true,
        order="aba"
    },
    {
        type = "int-setting",
        name = "aircraft-realism-user-low-fuel-warning-percentage",
        setting_type = "runtime-per-user",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 10,
        order="abb"
    },
    {
        type = "string-setting",
        name = "aircraft-realism-user-speed-unit",
        setting_type = "runtime-per-user",
        default_value = "metric",
        allowed_values = {
            "metric",
            "imperial"
        },
        allow_blank = false,
        order="abc"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-sounds-enabled",
        setting_type = "runtime-per-user",
        default_value = true,
        order="abd"
    }
})
