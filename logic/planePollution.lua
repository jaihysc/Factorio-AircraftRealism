-- Handles polluting the surface
local function createPollution(settings, surface, plane)
    if settings.global["aircraft-emit-pollution"].value then
        if plane.burner and plane.burner.currently_burning then
            -- More pollution is emitted at higher speeds, also depending on the fuel
            local emissions = settings.global["aircraft-pollution-amount"].value
            emissions = emissions * plane.burner.currently_burning.fuel_emissions_multiplier
            surface.pollute(plane.position, emissions * math.abs(plane.speed))
        end
    end
end

local functions = {}

functions.createPollution = createPollution

return functions