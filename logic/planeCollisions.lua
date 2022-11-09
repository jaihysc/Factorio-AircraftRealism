-- Handles environmental collisions of the plane WITH DRIVER (cliffs, water)
local utility = require("logic.utility")

local function obstacleCollision(settings, surface, player, plane)

    -- Destroy the plane if the player LANDS ON a cliff
    for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()-0.4, name = {"cliff"}})) do
        if plane.speed == 0 then
            utility.killDriverAndPassenger(plane, player)

            return;
        end
    end
    -- Destroy the plane upon landing in water
    local tile = surface.get_tile(plane.position)
	if tile == nil or not tile.valid then
		return;
	end
    if tile.name == "water" or tile.name == "water-shallow" or tile.name == "water-mud"or tile.name == "water-green" or tile.name == "deepwater" or tile.name == "deepwater-green" then
        if plane.speed == 0 then  --Player + passenger dies too since they will just be stuck anyways
            utility.killDriverAndPassenger(plane, player)

            return;
        end
    end

    if settings.global["aircraft-realism-environmental-impact"].value then
        for k, entity in pairs(surface.find_entities_filtered({position = plane.position, radius = plane.get_radius()+2, name = {"cliff"}})) do
            --Over 40km/h
            if plane.speed > 0.185185 or plane.speed < -0.185185 then -- Destroy the plane upon hitting a cliff
                plane.die()

                return;
            end
        end
        for k, entity in pairs(surface.find_tiles_filtered({position = plane.position, radius = plane.get_radius()+2, name = {"water", "water-shallow", "water-mud", "water-green", "deepwater", "deepwater-green"}})) do
            if plane.speed > 0.185185 or plane.speed < -0.185185 then -- upon hitting the shoreline
                plane.die()

                return;
            end
        end
    end
end

local functions = {}

functions.obstacleCollision = obstacleCollision

return functions