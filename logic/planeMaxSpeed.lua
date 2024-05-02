local utility = require("logic.utility")

local function checkMaxSpeed(plane)
    assert(plane)
    assert(plane.name)

    local maxSpeed = utility.getMaxSpeed(plane.name)
    if plane.speed and maxSpeed then
        -- Clamp the plane speed to max speed
        if plane.speed > maxSpeed then
            plane.speed = maxSpeed
        end
        if plane.speed < -maxSpeed then
            plane.speed = -maxSpeed
        end
    end
end

function onTick(e)
    for index, player in pairs(game.connected_players) do  -- loop through all online players on the server
        if player and player.vehicle and player.vehicle.name and utility.isPlane(player.vehicle.name) then
            checkMaxSpeed(player.vehicle)
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers