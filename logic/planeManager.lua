local planeCollisions = require("logic.planeCollisions")
local planePollution = require("logic.planePollution")
local planeRunway = require("logic.planeRunway")
local planeTakeoffLanding = require("logic.planeTakeoffLanding")
local planeUtility = require("logic.planeUtility")
local guiController = require("logic.guiController")


--Checks the planes and performs all the functions a plane should do
local function checkPlanes(e, player, game, defines, settings)
    local quarterSecond = e.tick % 15 == 0 --15 ticks, 1/4 of a second

    if quarterSecond then
        CheckHelicopterMod(player)
    end

    if planeUtility.isGroundedPlane(player.vehicle.name) then
        --These don't need to be checked as often, so they run off quarterSecond
        if quarterSecond then

            planePollution.createPollution(settings, player.surface, player.vehicle)
            --Create some smoke effects trailing behind the plane
            player.surface.create_trivial_smoke{name="train-smoke", position=player.position, force="neutral"}

            planeTakeoffLanding.planeTakeoff(player, game, defines, settings)
        end

        guiController.updateGaugeArrows(player, settings, game)

        --Collision gets checked every tick for accuracy
        if planeRunway.validateRunwayTile(settings, player.surface, player.vehicle) then --Returns false if the plane did not pass and was destroyed
            --Test for obstacle collision (water, cliff)
            planeCollisions.obstacleCollision(settings, game.surfaces[1], player, player.vehicle)
        end

    elseif quarterSecond and planeUtility.isAirbornePlane(player.vehicle.name) then
        planePollution.createPollution(settings, player.surface, player.vehicle)

        guiController.updateGaugeArrows(player, settings, game)

        planeTakeoffLanding.planeLand(player, game, defines, settings)
    end
end


--Makes these functions available to the lua script which requires this file
local functions = {}

functions.checkPlanes = checkPlanes

return functions