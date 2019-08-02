--Collision while on the ground is done by having a separate copy of each plane, teleporting the player into the grounded version once below landing speed
--and out into the flyable one surpassing landing speed

------------------------------
--Landed versions of planes
------------------------------

--(Compared to the default aircraft from Aircraft)
--Disallows planes to turn on the spot
--Increases the turn radius
--Lowers braking power for longer landing stoping distance
--Less health on ground for more severe impact damage (divided by 5)
--More weight for slower acceleration (~5x)

--WARNING
--max_health must be the max_health of the original plane DIVIDED BY 5
function ExtendGroundedAircraft(name, rotation_speed, braking_power, max_health, weight, collision_box)
    data.raw.car[name].collision_mask = {"player-layer", "train-layer", "consider-tile-transitions"}

    if settings.startup["aircraft-realism-turn-radius"].value then
        data.raw.car[name].tank_driving = false
        data.raw.car[name].rotation_speed = rotation_speed
    end

    if settings.startup["aircraft-realism-braking-speed"].value then data.raw.car[name].braking_power = braking_power end
    if settings.startup["aircraft-realism-takeoff-health"].value then
        data.raw.car[name].max_health = max_health
        data.raw.car[name].repair_speed_modifier = 0.2; --Account for less health by reducing the repair speed by 5x
    end

    data.raw.car[name].weight = weight

    if settings.startup["aircraft-realism-acceleration"].value then
        data.raw.car[name].friction = 0.0001 --Lower the friction so the plane can still reach its max speed
        data.raw.car[name].collision_box = collision_box
        data.raw.car[name].selection_box = collision_box
    end
end

--Gunship
ExtendGroundedAircraft("gunship", 0.008, "380kW", 100, 3750, {{-2, -2}, {2, 2}})
--Cargo plane
ExtendGroundedAircraft("cargo-plane", 0.006, "510kW", 100, 27500, {{-1, -1.5}, {1, 1.5}})
--Jet
ExtendGroundedAircraft("jet", 0.005, "400kW", 50, 1500, {{-2, -2}, {2, 2}})
--Flying fortress
ExtendGroundedAircraft("flying-fortress", 0.01, "2120kW", 400, 15000, {{-2, -2}, {2, 2}})


------------------------------------------------------
--OTHER MODS
------------------------------------------------------

--Better cargo planes
if mods["betterCargoPlanes"] then
    ExtendGroundedAircraft("better-cargo-plane", 0.0065, "780kW", 200, 31500, {{-0.9, -1.3}, {0.9, 1.3}}) --Gets more breaking power, turn radius since it is better, heavier too since it has more inventory
    ExtendGroundedAircraft("even-better-cargo-plane", 0.007, "1080kW", 400, 37500, {{-0.9, -1.3}, {0.9, 1.3}})
end