-- Test for plane type for plane name in the array of recognisedPlanes

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
    plane.get_driver().die(player.force, plane)
    local passenger = plane.get_passenger()
    if passenger then passenger.die(player.force, plane) end
    plane.die()
end

-- Makes these functions available to the lua script which requires this file
local functions = {}

functions.isGroundedPlane = isGroundedPlane
functions.isAirbornePlane = isAirbornePlane
functions.killDriverAndPassenger = killDriverAndPassenger

return functions