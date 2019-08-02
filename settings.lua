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
        type = "bool-setting",
        name = "aircraft-realism-environmental-impact",
        setting_type = "runtime-global",
        default_value = true,
        order="aaf"
    },
    {
        type = "bool-setting",
        name = "aircraft-emit-pollution",
        setting_type = "runtime-global",
        default_value = true,
        order="aag"
    },
    {
        type = "double-setting",
        name = "aircraft-pollution-amount",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 1,
        order="aah"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-gunship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 130,
        order="aai"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 70,
        order="aaj"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 320,
        order="aak"
    },
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 140,
        order="aal"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-gunship",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 110,
        order="aam"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-cargo-plane",
        setting_type = "runtime-global",
        default_value = 50,
        order="aan"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-jet",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 290,
        order="aao"
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-flying-fortress",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 120,
        order="aap"
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
        order="aaq"
    }
})

------------------------------------------------------
--OTHER MODS
------------------------------------------------------

--Better cargo planes
if mods["betterCargoPlanes"] then
    data:extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 110,
            order="ada"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 120,
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