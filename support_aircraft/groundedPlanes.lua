local aircraftMaker = require("__AircraftRealism__.aircraftMaker")

-- Landed versions of planes
------------------------------
-- Disallows planes to turn on the spot
-- Increases the turn radius
-- Lowers braking power for longer landing stoping distance
-- Less health on ground for more severe impact damage (divided by 2)
-- More weight for slower acceleration (~5x)

-- max_health must be the max_health of the original plane DIVIDED BY 2

-- Converts mod's planes to grounded versions
function toGroundedAircraft(name, rotation_speed, braking_power, max_health, weight, collision_box)
    local s = aircraftMaker.getSettings();

    local plane = data.raw.car[name]
    plane.collision_mask = {"player-layer", "train-layer"}

    if s.rAcceleration then
        plane.weight = weight
        plane.friction = 0.0001 -- Lower the friction so the plane can still reach its max speed
    end

    if s.rBraking then
        plane.braking_power = braking_power
    end

    if s.rTurnRadius then
        plane.rotation_speed = rotation_speed
    end

    plane.max_health = max_health
    plane.collision_box = collision_box
    plane.selection_box = collision_box

    return plane
end

if mods["Aircraft"] then
    local gunship        = toGroundedAircraft("gunship"        , 0.008, "380kW", 250, 3750, {{-2, -2}, {2, 2}})
    local cargoPlane     = toGroundedAircraft("cargo-plane"    , 0.006, "610kW", 250, 20500, {{-1.5, -1.5}, {1.5, 1.5}})
    local jet            = toGroundedAircraft("jet"            , 0.005, "540kW", 125, 1500, {{-2, -2}, {2, 2}})
    local flyingFortress = toGroundedAircraft("flying-fortress", 0.01, "2620kW", 1000, 15000, {{-2, -2}, {2, 2}})

    aircraftMaker.makeGrounded({prototype = gunship})
    aircraftMaker.makeGrounded({prototype = cargoPlane})
    aircraftMaker.makeGrounded({prototype = jet})
    aircraftMaker.makeGrounded({prototype = flyingFortress})
end

------------------------------------------------------
-- OTHER MODS
------------------------------------------------------

-- Better cargo planes
if mods["betterCargoPlanes"] then
    -- Gets more breaking power, turn radius since it is better, heavier too since it has more inventory
    local bCargoPlane  = toGroundedAircraft("better-cargo-plane"     , 0.0065, "1080kW", 500, 31500, {{-1.3, -1.3}, {1.3, 1.3}})
    local ebCargoPlane = toGroundedAircraft("even-better-cargo-plane", 0.007, "1680kW", 1000, 37500, {{-1.3, -1.3}, {1.3, 1.3}})
    aircraftMaker.makeGrounded({prototype = bCargoPlane})
    aircraftMaker.makeGrounded({prototype = ebCargoPlane})
end