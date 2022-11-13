local utility = require("logic.utility")

local showTakeoffDistShortcut = "aircraft-realism-show-takeoff-distance"

-- Draws line indicating takeoff distance for player plane
-- lineLife: Ticks to show line drawn
local function showTakeoffDist(player, plane, lineLife)
    assert(player)
    assert(plane)
    assert(type(lineLife) == "number")

    assert(plane.prototype.weight, "Plane prototype missing weight. Check plane prototypes")
    assert(plane.prototype.consumption, "Plane prototype missing consumption. Check plane prototypes")
    assert(plane.prototype.friction_force, "Plane prototype missing friction_force. Check plane prototypes")
    assert(plane.prototype.effectivity, "Plane prototype missing effectivity. Check plane prototypes")

    local maxTime = 15 -- Give up calculation if takeoff time too long

    -- Use SI units to avoid confusion and conversion errors

    local dt = 1/60 -- 1/60 second = 1 tick
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
            u_c = u_c * plane.burner.currently_burning.fuel_acceleration_multiplier
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

    local succeeded = false
    while t < maxTime do
        v = math.sqrt(2*E/m) -- speed
        if v >= v_tk then
            succeeded = true
            break
        end

        t = t + dt

        -- TODO friction calculation for tiles not that accurate
        -- Friction loss is a function of tile currently over
        local u_ft = 1
        local tile = player.surface.get_tile({x=plane.position.x + r_x*s, y=plane.position.y + r_y*s})
        -- Tile may not exist (out of map)
        if tile.valid then
            u_ft = tile.prototype.vehicle_friction_modifier -- Terrain friction
        end
        u_f = 1 - u_fc*(1 + u_ft)

        -- Factorio calculates friction loss as E * friction multiplier
        E = E*u_f + E_gain*dt
        s = s +v*dt
    end

    -- Show orange line to show calculation timed out
    local line_color = {0, 0.5, 0, 0.5} -- Green
    if not succeeded then
        line_color = {0.9, 0.5, 0.1, 0.5} -- Orange
    end
    local takeoffPos = {x=plane.position.x + r_x*s, y=plane.position.y + r_y*s}
    rendering.draw_line{
        surface=player.surface,
        from=plane.position, to=takeoffPos,
        color=line_color,
        width=10,
        time_to_live=lineLife,
        players={player},
        draw_on_ground=true
    }

    -- The player can add their own factor of safety
    --[[
    -- Add a factor of safety to prediction
    local marginDist = 10
    local safeTakeoffPos = {x=takeoffPos.x + r_x*marginDist, y=takeoffPos.y + r_y*marginDist}
    rendering.draw_line{
        surface=player.surface,
        from=takeoffPos, to=safeTakeoffPos,
        color={0.9, 0.5, 0.1, 0.5},
        width=10,
        time_to_live=lineLife,
        players={player},
        draw_on_ground=true
    }
    ]]
end

function onTick(e)
    for index,player in pairs(game.connected_players) do  -- loop through all online players on the server
        if player then
            -- Set takeoff distance line target to currently hovered over
            -- if on same force
            if player.selected and
               player.selected.force == player.force and
               utility.isGroundedPlane(player.selected.prototype.name) and
               player.is_shortcut_toggled(showTakeoffDistShortcut) then
                if not global.showTakeoffDist then
                    global.showTakeoffDist = {}
                end
                global.showTakeoffDist[player.index] = player.selected
            end
            -- Draw takeoff distance line
            if global.showTakeoffDist and
               global.showTakeoffDist[player.index] then
                if global.showTakeoffDist[player.index].valid then
                    showTakeoffDist(player, global.showTakeoffDist[player.index], 2)
                else
                    -- Plane gone (destroyed, took off, etc)
                    global.showTakeoffDist[player.index] = nil
                end
            end
        end
    end
end

function onLuaShortcut(e)
    if e.prototype_name == showTakeoffDistShortcut then
        local player = game.get_player(e.player_index)
        if player then
            local newState = not player.is_shortcut_toggled(showTakeoffDistShortcut)
            player.set_shortcut_toggled(showTakeoffDistShortcut, newState)

            -- Stop showing takeoff distance
            if newState == false and
               global.showTakeoffDist and
               global.showTakeoffDist[player.index] then
                global.showTakeoffDist[player.index] = nil
            end
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
handlers[defines.events.on_lua_shortcut] = onLuaShortcut
return handlers