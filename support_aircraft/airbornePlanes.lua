local aircraftMaker = require("__AircraftRealism__.aircraftMaker")

-- May be subject to change depending on Aircraft author
-- Layer 1: Plane
-- Layer 2: Shadow
local ANIMATION_SHADOW_LAYER = 2

-- Airborne variants of the planes
------------------------------
-- Faster acceleration since airborne and there is less resistance
-- Slightly increased braking power compared to grounded version
-- Wider turn radius compared to grounded version

function makeRealistic(plane, rotation_speed, braking_power, max_health, weight)
    local s = aircraftMaker.getSettings();

    if s.rAcceleration then
        plane.weight = weight
        plane.friction = 0.0003 -- Less friction so they glide and don't constantly need one to hold the accelerator
    end

    if s.rBraking then
        plane.braking_power = braking_power
    end

    if s.rTurnRadius then
        plane.rotation_speed = rotation_speed
    end

    if s.noAerialShadow then
        if plane.animation.layers then
            local shadow_layer = plane.animation.layers[ANIMATION_SHADOW_LAYER]
            if shadow_layer then
                -- Normal quality sprites
                shadow_layer.tint = {0,0,0,0}
                -- hr quality sprites
                if shadow_layer.hr_version then
                    shadow_layer.hr_version.tint = {0,0,0,0}
                end
            end
        end
    end
end

if mods["Aircraft"] then
    local gunship        = aircraftMaker.makeAirborne({name="gunship"})
    local cargoPlane     = aircraftMaker.makeAirborne({name="cargo-plane"})
    local jet            = aircraftMaker.makeAirborne({name="jet"})
    local flyingFortress = aircraftMaker.makeAirborne({name="flying-fortress"})

    makeRealistic(gunship       , 0.005, "940kW", 500, 5000)
    makeRealistic(cargoPlane    , 0.003, "1100kW", 500, 25000)
    makeRealistic(jet           , 0.003, "950kW", 250, 1200)
    makeRealistic(flyingFortress, 0.008, "3420kW", 2000, 7500)
end

------------------------------------------------------
-- OTHER MODS
------------------------------------------------------

-- Better cargo planes
if mods["betterCargoPlanes"] then
    local bCargoPlane  = aircraftMaker.makeAirborne({name="better-cargo-plane"})
    local ebCargoPlane = aircraftMaker.makeAirborne({name="even-better-cargo-plane"})
    makeRealistic(bCargoPlane , 0.0035, "1680kW", 1000, 34000)
    makeRealistic(ebCargoPlane, 0.0045, "2660kW", 2000, 40000)
end
