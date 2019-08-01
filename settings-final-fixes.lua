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
        name = "aircraft-realism-environmental-impact",
        setting_type = "runtime-global",
        default_value = true,
        order="aae"
    },
    {
        type = "bool-setting",
        name = "aircraft-emit-pollution",
        setting_type = "runtime-global",
        default_value = true,
        order="aaf"
    },
    {
        type = "double-setting",
        name = "aircraft-pollution-amount",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 2,
        order="aag"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-dropship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 130,
        order="aah"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 70,
        order="aai"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 340,
        order="aaj"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 140,
        order="aak"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-dropship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 110,
        order="aal"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 50,
        order="aam"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 300,
        order="aan"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 120,
        order="aao"
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
        order="aap"
    }
})