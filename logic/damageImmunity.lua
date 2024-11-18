local utility = require("logic.utility")

-- Makes the immune against certain sources of damage, e.g., biters
local function onEntityDamaged(e)
    if settings.global[utility.S_AIRBORNE_DAMAGE_IMMUNITY].value then
        if e and e.entity and e.final_damage_amount and e.final_health and e.cause then
            local plane = e.entity
            if utility.isAirbornePlane(plane.prototype.name) then
                plane.health = e.final_health + e.final_damage_amount
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_entity_damaged] = onEntityDamaged
return handlers
