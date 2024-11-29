local utility = require("logic.utility")

--[[
    Global table:
        showTakeoffDist[]: table
            {
                plane: LuaEntity
                timeout: bool
                    Calculation timeout
                onRunway: bool
                    Takeoff path is on runway
                distance: number
                    Takeoff distance
                dirX: number
                    Plane direction unit vector
                dirY: number
            }

            Index by player index
            Holds the Takeoff distance estimation (TDE) data for the player
]]

-- Calculates takeoff distance, stored in provided table (element of showTakeoffDist)
local function calcTakeoffDist(result)
    assert(result)
    local plane = result.plane

    assert(plane.prototype.weight, "Plane prototype missing weight. Check plane prototypes")
    assert(plane.prototype.consumption, "Plane prototype missing consumption. Check plane prototypes")
    assert(plane.prototype.friction_force, "Plane prototype missing friction_force. Check plane prototypes")
    assert(plane.prototype.effectivity, "Plane prototype missing effectivity. Check plane prototypes")

    -- Calculation properties
    local maxTime = 10 -- Give up calculation if takeoff time too long
    local dt = 1/60 -- 1/60 second = 1 tick

    -- Use SI units to avoid confusion and conversion errors

    local m = plane.prototype.weight -- Mass (kg)
    -- For speed: tile/tick -> m/s
    local v_0 = plane.speed * 60 -- Initial speed (m/s)
    local v_tk = utility.getTransitionSpeed(plane.prototype.name) * 60 -- Takeoff speed (m/s)
    -- J/tick -> J/s
    local c = plane.prototype.consumption * 60 -- Consumption (W)
    local u_fc = 1 -- Vehicle friction
    u_fc = u_fc * plane.prototype.friction_force
    u_fc = u_fc * plane.friction_modifier

    local u_c = 1 -- Multiplier on consumption
    u_c = u_c * plane.prototype.effectivity
    u_c = u_c * plane.effectivity_modifier
    u_c = u_c * plane.consumption_modifier
    -- Fuel acceleration multiplier
    if plane.burner then
        if plane.burner.currently_burning then
            -- Use burning fuel for acceleration multiplier
            u_c = u_c * plane.burner.currently_burning.name.fuel_acceleration_multiplier
        elseif plane.burner.inventory then
            -- Use first fuel in fuel slot for acceleration multiplier
            for i = 1, #plane.burner.inventory, 1 do
                local slot = plane.burner.inventory[i]
                if slot.valid_for_read then
                    u_c = u_c * slot.prototype.fuel_acceleration_multiplier
                    break
                end
            end
        end
    end
    -- Acceleration multiplier
    if plane.grid and not plane.grid.inhibit_movement_bonus then
        local bonus = 1
        for i=1, #plane.grid.equipment, 1 do
            local equipment = plane.grid.equipment[i]
            if equipment.energy and equipment.energy > 0 then
                bonus = bonus + equipment.movement_bonus
            end
        end
        u_c = u_c * bonus
    end

    -- Cannot take off with negative speeds, treat as 0
    if v_0 < 0 then
        v_0 = 0
    end

    local E_gain = u_c*c -- Energy plane gains (J/s)
    local E = 0.5 * m * v_0*v_0 -- Initial energy (J)
    local s = 0 -- Initial displacement (m)
    local t = 0 -- Initial time (s)

    -- Construct unit vector to compute plane position
    -- Note this is clockwise from north
    local planeRad = plane.orientation*2*math.pi
    local r_x = math.sin(planeRad)
    local r_y = -math.cos(planeRad) -- Positive y is downwards

    local maxTileFriction = settings.global[utility.S_RUNWAY_MAX_FRICTION].value
    if not settings.global[utility.S_RUNWAY_REQUIREMENT].value then
        maxTileFriction = 1000000
    end

    local timeout = true
    local onRunway = true
    while t < maxTime do
        v = math.sqrt(2*E/m) -- speed
        if v >= v_tk then
            timeout = false
            break
        end

        t = t + dt

        -- TODO friction calculation for tiles not that accurate
        -- Friction loss is a function of tile currently over
        local u_ft = 1
        local tile = plane.surface.get_tile({x=plane.position.x + r_x*s, y=plane.position.y + r_y*s})
        -- Tile may not exist (out of map)
        if tile.valid then
            u_ft = tile.prototype.vehicle_friction_modifier -- Terrain friction

            -- Check plane is on runway (if runway requirement set)
            if tile.prototype.vehicle_friction_modifier >= maxTileFriction then
                onRunway = false
                break
            end

            -- Check plane does not collide with the tile (water, etc)
            for layer, _ in pairs(plane.prototype.collision_mask.layers) do
                if tile.collides_with(layer) then
                    onRunway = false
                    break
                end
            end
            if not onRunway then
                break
            end
        end
        u_f = 1 - u_fc*(1 + u_ft)

        -- Factorio calculates friction loss as E * friction multiplier
        E = E*u_f + E_gain*dt
        s = s + v*dt
    end

    result.plane = plane
    result.timeout = timeout
    result.onRunway = onRunway
    result.distance = s
    result.dirX = r_x
    result.dirY = r_y
end

-- Draws UI indicating takeoff distance for player
local function showTakeoffDist(player, result)
    assert(player)
    assert(result)
    local plane = result.plane

    -- Outline for selected plane
    local diffX = (plane.bounding_box.left_top.x - plane.bounding_box.right_bottom.x)
    local diffY = (plane.bounding_box.left_top.y - plane.bounding_box.right_bottom.y)
    local outlineRadius = math.sqrt(diffX * diffX + diffY * diffY) -- Use length of bounding box for radius
    rendering.draw_circle{
        color        = {1, 1, 1, 1},
        radius       = outlineRadius,
        width        = 4,
        target       = plane.position,
        surface      = plane.surface,
        time_to_live = 1,
        players      = {player},
    }

    -- Line for takeoff distance
    -- Show orange line to show calculation timed out
    local lineColor = {0, 0.5, 0, 0.5} -- Green
    if result.timeout or not result.onRunway then
        lineColor = {0.9, 0.5, 0.1, 0.5} -- Orange
    end
    local takeoffPos = {x=plane.position.x + result.dirX * result.distance, y=plane.position.y + result.dirY * result.distance}
    rendering.draw_line{
        surface        = plane.surface,
        from           = plane.position, to=takeoffPos,
        color          = lineColor,
        width          = 10,
        time_to_live   = 1,
        players        = {player},
        draw_on_ground = true
    }

    -- Info text
    -- Along the line for takeoff position, nearest to the player
    -- v (u . v), project u along v, scale v
    local infoVecMag = ((player.position.x - plane.position.x) * result.dirX + (player.position.y - plane.position.y) * result.dirY)
    if infoVecMag < 0 then
        infoVecMag = 0
    elseif infoVecMag > result.distance then
        infoVecMag = result.distance
    end
    local infoVecX = infoVecMag * result.dirX
    local infoVecY = infoVecMag * result.dirY
    if not result.onRunway then
        rendering.draw_circle{
            color        = {1, 0, 0, 1},
            radius       = 1,
            width        = 8,
            target       = takeoffPos,
            surface      = plane.surface,
            time_to_live = 1,
            players      = {player}
        }
        rendering.draw_text{
            text         = {"decorative-name.aircraft-realism-tde-runway-too-short"},
            surface      = plane.surface,
            target       = {x=plane.position.x + infoVecX, y=plane.position.y + infoVecY},
            color        = {1, 1, 1, 1},
            scale        = 3,
            time_to_live = 1,
            players      = {player}
        }
    else
        local distancePrefix = ""
        if result.timeout then
            distancePrefix = "> "
        end
        rendering.draw_text{
            text         = {"decorative-name.aircraft-realism-tde-distance", distancePrefix .. math.floor(result.distance + 0.5)},
            surface      = plane.surface,
            target       = {x=plane.position.x + infoVecX, y=plane.position.y + infoVecY},
            color        = {1, 1, 1, 1},
            scale        = 3,
            time_to_live = 1,
            players      = {player}
        }
        if result.timeout then
            rendering.draw_text{
                text         = {"decorative-name.aircraft-realism-tde-timeout"},
                surface      = plane.surface,
                target       = {x=plane.position.x + infoVecX, y=plane.position.y + infoVecY + 1.5},
                color        = {1, 1, 1, 1},
                scale        = 3,
                time_to_live = 1,
                players      = {player}
            }
        end
    end
end

function onTick(e)
    if not storage.showTakeoffDist then
        storage.showTakeoffDist = {}
    end

    for index,player in pairs(game.connected_players) do  -- loop through all online players on the server
        if player and player.surface then
            -- Set takeoff distance target to currently hovered over if on same force
            -- Only check every 5 ticks to avoid flickering since results are not calculated in this tick
            if e.tick % 5 == 0 then
                if player.selected and
                player.selected.force == player.force and
                utility.isGroundedPlane(player.selected.prototype.name) and
                player.is_shortcut_toggled(utility.UI_SHOW_TAKEOFF_DIST) then
                    -- Do not override table if selected plane has not changed
                    local prevResult = storage.showTakeoffDist[player.index]
                    if not prevResult or not prevResult.plane.valid or prevResult.plane ~= player.selected then
                        storage.showTakeoffDist[player.index] = {plane=player.selected}
                    end
                end
            end

            local result = storage.showTakeoffDist[player.index]
            if result then
                -- Check type of result, to work on old saves still using LuaEntity in showTakeoffDist array
                if type(result) == "table" and result.plane.valid then
                    if e.tick % 5 == 0 then
                        calcTakeoffDist(result)
                    end

                    -- Show UI for takeoff distance every tick so it is smooth
                    showTakeoffDist(player, result)
                else
                    -- Plane gone (destroyed, took off, etc)
                    storage.showTakeoffDist[player.index] = nil
                end
            end
        end
    end
end

function onLuaShortcut(e)
    if e.prototype_name == utility.UI_SHOW_TAKEOFF_DIST then
        local player = game.get_player(e.player_index)
        if player then
            local newState = not player.is_shortcut_toggled(utility.UI_SHOW_TAKEOFF_DIST)
            player.set_shortcut_toggled(utility.UI_SHOW_TAKEOFF_DIST, newState)

            -- Stop showing takeoff distance
            if newState == false and
                storage.showTakeoffDist and
                storage.showTakeoffDist[player.index] then
                storage.showTakeoffDist[player.index] = nil
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
handlers[defines.events.on_lua_shortcut] = onLuaShortcut
return handlers