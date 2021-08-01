-- Information is stored in the prototype order on whether or not it is a plane
local function isGroundedPlane(order)
    local suffix = "-__Z9ZC_G"
    return order:sub(-string.len(suffix)) == suffix
end

local function isAirbornePlane(order)
    local suffix = "-__Z9ZC_A"
    return order:sub(-string.len(suffix)) == suffix
end

local function killDriverAndPassenger(plane, player)
    local driver = plane.get_driver()

    -- get_driver() and get_passenger() returns LuaPlayer OR LuaEntity
    -- die() only exists for LuaEntity
    if driver and not driver.is_player() then
        driver.die(player.force, plane)
    end

    local passenger = plane.get_passenger()
    if passenger and not passenger.is_player() then
        passenger.die(player.force, plane)
    end

    plane.die()
end

local functions = {}

functions.isGroundedPlane = isGroundedPlane
functions.isAirbornePlane = isAirbornePlane
functions.killDriverAndPassenger = killDriverAndPassenger

return functions