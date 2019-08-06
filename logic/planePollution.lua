-- Handles polluting the surface
local function createPollution(settings, surface, plane)
    if settings.global["aircraft-emit-pollution"].value then

        -- More pollution is emitted at higher speeds, also depending on the fuel
        local emissions = settings.global["aircraft-pollution-amount"].value
        if plane.burner.currently_burning then
            emissions = emissions * plane.burner.currently_burning.fuel_emissions_multiplier
        end

        surface.pollute(plane.position, emissions * math.abs(plane.speed))
    end
end

-- Makes these functions available to the lua script which requires this file
local functions = {}

functions.createPollution = createPollution

return functions