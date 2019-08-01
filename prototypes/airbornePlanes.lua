------------------------------
--Airborne variants of the planes
------------------------------
--Slightly reduced braking power compared to grounded version
--Wider turn radius compared to grounded version

function ExtendAirborneAircraft(name, rotation_speed, braking_power, max_health)
    local plane = table.deepcopy(data.raw.car[name])

    plane.name = name .. "-airborne"
    plane.order = name .. "-airborne"

    if settings.startup["aircraft-realism-turn-radius"].value then
        plane.tank_driving = false
        plane.rotation_speed = rotation_speed
    end
    if settings.startup["aircraft-realism-braking-speed"].value then plane.braking_power = braking_power end
    if settings.startup["aircraft-realism-takeoff-health"].value then plane.max_health = max_health end

    plane.collision_box = {{-3, -3}, {3, 3}} --Disallow the player from jumping out of the plane
    data:extend{plane}
end

--Gunship
ExtendAirborneAircraft("gunship", 0.005, "70kW", 500)

--Cargo-plane
ExtendAirborneAircraft("cargo-plane", 0.003, "40kW", 500)

--jet
ExtendAirborneAircraft("jet", 0.006, "50kW", 250)

--Flying fortress
ExtendAirborneAircraft("flying-fortress", 0.008, "50kW", 2000)