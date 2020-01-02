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
        default_value = true,
        order="aad"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-no-aerial-shadows",
        setting_type = "startup",
        default_value = true,
        order="aae"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-fuel-usage-multiplier-grounded",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 2,
        order="aaf"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-fuel-usage-multiplier-airborne",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 2.25,
        order="aag"
    },
    {-- RUNTIME SETTINGS
        type = "bool-setting",
        name = "aircraft-realism-strict-runway-checking",
        setting_type = "runtime-global",
        default_value = false,
        order="aah"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-strict-runway-checking-maximum-tile-vehicle-friction",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 0.8,
        order="aai"
    },
    {
        type = "double-setting",
        name = "aircraft-realism-strict-runway-max-taxi-speed",
        setting_type = "runtime-global",
        minimum_value = 1,
        default_value = 35,
        order="aaj"
    },
    {
        type = "bool-setting",
        name = "aircraft-realism-environmental-impact",
        setting_type = "runtime-global",
        default_value = false,
        order="aak"
    },
    {
        type = "bool-setting",
        name = "aircraft-emit-pollution",
        setting_type = "runtime-global",
        default_value = false,
        order="aal"
    },
    {
        type = "double-setting",
        name = "aircraft-pollution-amount",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 0.1,
        order="aam"
    },
    { --takeoff speed
        type = "double-setting",
        name = "aircraft-takeoff-speed-gunship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 130,
        order="aan"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 70,
        order="aao"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 280,
        order="aap"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 140,
        order="aaq"
    },
    { --landing speed
        type = "double-setting",
        name = "aircraft-landing-speed-gunship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 110,
        order="aar"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 50,
        order="aas"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 200,
        order="aat"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 120,
        order="aau"
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
        order="aav"
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
    }
})




------------------------------------------------------
-- OTHER MODS
------------------------------------------------------

--Better cargo planes
if mods["betterCargoPlanes"] then
    data:extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 80,
            order="ada"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 85,
            order="adb"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 60,
            order="bda"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 70,
            order="bdb"
        },
    })
end