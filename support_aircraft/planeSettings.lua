if mods["Aircraft"] then
    data:extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-gunship",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 130,
            order = "ata"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-cargo-plane",
            setting_type = "runtime-global",
            default_value = 70,
            order = "atb"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-jet",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 280,
            order = "atc"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-flying-fortress",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 140,
            order = "atd"
        },
        { --landing speed
            type = "double-setting",
            name = "aircraft-landing-speed-gunship",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 110,
            order = "ala"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-cargo-plane",
            setting_type = "runtime-global",
            default_value = 50,
            order = "alb"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-jet",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 200,
            order = "alc"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-flying-fortress",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 120,
            order = "ald"
        }
    })
end
--Better cargo planes
if mods["betterCargoPlanes"] then
    data:extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 80,
            order = "ada"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 85,
            order = "adb"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 60,
            order = "bda"
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 70,
            order = "bdb"
        }
    })
end