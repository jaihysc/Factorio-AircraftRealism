------------------------------
-- Airborne variants of the planes
------------------------------

-- Faster acceleration since airborne and there is less resistance
-- Slightly increased braking power compared to grounded version
-- Wider turn radius compared to grounded version

function ExtendAirborneAircraft(name, rotation_speed, braking_power, max_health, weight, hasTakeoffSprites)
    local plane = table.deepcopy(data.raw.car[name])

    plane.name = name .. "-airborne"
    plane.order = name .. "-airborne"

    if settings.startup["aircraft-realism-turn-radius"].value then
        plane.tank_driving = false
        plane.rotation_speed = rotation_speed
    end

    if settings.startup["aircraft-realism-acceleration"].value then
        plane.weight = weight
        plane.friction = 0.0003 -- Less friction so they glide and don't constantly need one to hold the accelerator
    end

    if settings.startup["aircraft-realism-braking-speed"].value then
        plane.braking_power = braking_power
    end

    if settings.startup["aircraft-realism-takeoff-health"].value then
        plane.max_health = max_health
    end

    -- Use custom sprotesheets with no shadows when airborne
    if settings.startup["aircraft-realism-braking-speed"].value and hasTakeoffSprites then
        plane.animation.filename = "__AircraftRealism__/graphics/" .. name .. "_Spritesheet_Shadowless.png"
    end

    -- Fuel consumption multiplier

    -- Get eng unit len of consumption
    local engUnitLen = 0
    for i=string.len(plane.consumption), 1, -1 do
        if tonumber(string.sub(plane.consumption, i, i)) ~= nil then
            break
        end
        engUnitLen = engUnitLen + 1
    end

    -- Multiply consumption
    local oldConsumptionNum = tonumber(
        string.sub(plane.consumption, 1, string.len(plane.consumption) - engUnitLen)
    )

    local newConsumptionNum = oldConsumptionNum * settings.startup["aircraft-realism-fuel-usage-multiplier-airborne"].value

    -- Add eng unit back
    local newConsumptionStr = tostring(newConsumptionNum) ..
        string.sub(plane.consumption, string.len(plane.consumption) - engUnitLen + 1)

    plane.consumption = newConsumptionStr

    -- Lower the fuel effectivity so the same energy goes to the wheels
    plane.effectivity = plane.effectivity / settings.startup["aircraft-realism-fuel-usage-multiplier-airborne"].value

    data:extend{plane}
end

-- Gunship
ExtendAirborneAircraft("gunship", 0.005, "940kW", 500, 5000, true)
-- Cargo-plane
ExtendAirborneAircraft("cargo-plane", 0.003, "1100kW", 500, 25000, true)
-- Jet
ExtendAirborneAircraft("jet", 0.003, "950kW", 250, 1200, true)
-- Flying fortress
ExtendAirborneAircraft("flying-fortress", 0.008, "3420kW", 2000, 7500, true)


------------------------------------------------------
-- OTHER MODS
------------------------------------------------------

-- Better cargo planes
if mods["betterCargoPlanes"] then
    ExtendAirborneAircraft("better-cargo-plane", 0.0035, "1680kW", 1000, 34000, false)
    ExtendAirborneAircraft("even-better-cargo-plane", 0.0045, "2660kW", 2000, 40000, false)
end
