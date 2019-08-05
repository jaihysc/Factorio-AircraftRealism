local recognisedPlanes = require("definitions.recognisedPlanes")

--Test for plane type for plane name in the array of recognisedPlanes
local function isGroundedPlane(name)
    for i,plane in pairs(recognisedPlanes) do
        if name == plane then
            return true
        end
    end

    return false
end

local function isAirbornePlane(name)
    for i,plane in pairs(recognisedPlanes) do
        if name == (plane .. "-airborne") then
            return true
        end
    end

    return false
end

local function killDriverAndPassenger(plane, player)
    plane.get_driver().die(player.force, plane)
    local passenger = plane.get_passenger()
    if passenger then passenger.die(player.force, plane) end
    plane.die()
end

--Makes these functions available to the lua script which requires this file
local functions = {}

functions.isGroundedPlane = isGroundedPlane
functions.isAirbornePlane = isAirbornePlane
functions.killDriverAndPassenger = killDriverAndPassenger

return functions