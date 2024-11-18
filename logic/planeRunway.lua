local utility = require("logic.utility")

-- Whether tile below grounded/airborne plane is on a runway
local function onRunway(plane)
    assert(plane)
    local tile = plane.surface.get_tile(plane.position)
    if not tile or not tile.valid then
        return false
    end
    return tile.prototype.vehicle_friction_modifier < settings.global[utility.S_RUNWAY_MAX_FRICTION].value
end

-- Checks grounded plane runway requirement, caps the max speed to the taxi speed when not on a runway
local function checkPlaneRunway(plane)
    assert(plane)

    if not onRunway(plane) then
        local maxTaxiSpeed = utility.toFactorioUnit(settings.global[utility.S_RUNWAY_TAXI_SPEED].value)

        local overspeed = math.abs(plane.speed) - maxTaxiSpeed
        if overspeed > 0 then
            -- Decrease speed proportional (k1) to differnce
            local k1 = 0.1
            if plane.speed > 0 then
                plane.speed = plane.speed - (k1 * overspeed)
            elseif plane.speed < 0 then
                plane.speed = plane.speed + (k1 * overspeed)
            end

            -- Damage proportional (k2) to difference
            local k2 = 0.25
            local damage = k2 * overspeed / utility.KPH2MPT
            plane.damage(damage, plane.force, "impact")
        end
    end
end

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        if player and player.driving and player.vehicle then
            if settings.global[utility.S_RUNWAY_REQUIREMENT].value and
               e.tick % 15 == 0 and
               utility.isGroundedPlane(player.vehicle.prototype.name) then
                checkPlaneRunway(player.vehicle)
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers
