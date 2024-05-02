if mods["Aircraft"] then
    data:extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-gunship",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 290,
            default_value = 130,
            order="ata"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 170,
            default_value = 70,
            order="atb"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-jet",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 590,
            default_value = 230,
            order="atc"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-flying-fortress",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 580,
            default_value = 140,
            order="atd"
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
            minimum_value = 10,
            maximum_value = 210,
            default_value = 80,
            order="ada"
        },
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-even-better-cargo-plane",
            setting_type = "runtime-global",
            minimum_value = 10,
            maximum_value = 280,
            default_value = 85,
            order="adb"
        }
    })
end