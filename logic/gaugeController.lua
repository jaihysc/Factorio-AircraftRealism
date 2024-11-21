local mod_gui = require("mod-gui")
local utility = require("logic.utility")

-- Calculates amount of fuel in plane, 0 to 1
local function getFuelPercentage(plane)
    assert(plane)
    local burner = plane.burner
    if not burner then
        return 0
    end

    local emptySlots = 0                 -- Empty fuel inventory slots
    local totalSlots = #burner.inventory -- Total fuel inventory slots

    local maxFuelValue = 0      -- Maximum possible fuel value with the current fuels, average with the current fuels for empty slots
    local countedFuelValue = 0  -- Total fuel value of all the items in the fuel inventory

    -- Calculate maximum fuel value for burner
    for i = 1, totalSlots, 1 do
        local item = burner.inventory[i]
        if item and item.valid_for_read then
            local fuelValue = prototypes.item[item.name]["fuel_value"]

            maxFuelValue = maxFuelValue + (prototypes.item[item.name]["stack_size"] * fuelValue)
            countedFuelValue = countedFuelValue + (item.count * fuelValue)
        else
            emptySlots = emptySlots + 1
        end
    end

    if maxFuelValue == 0 then -- Return if fuel inventory is empty, else we get divide by 0
        return 0
    end

    -- If a slot is empty, its fuel value is average by the slots that does have fuel
    maxFuelValue = maxFuelValue + (maxFuelValue / (totalSlots - emptySlots) * emptySlots)

    return countedFuelValue / maxFuelValue
end

-- Gets left fuel gauge sprite index
local function getFuelGaugeLeftIndex(fuelPercentage)
    assert(fuelPercentage)
    local index = math.floor(fuelPercentage * (utility.UI_FUEL_L_NEEDLE_COUNT - 1) + 0.5)

    -- Clamp to range
    if index < 0 then
        index = 0
    elseif index >= utility.UI_FUEL_L_NEEDLE_COUNT then
        index = utility.UI_FUEL_L_NEEDLE_COUNT - 1
    end

    return index
end

-- Gets right fuel gauge sprite index
local function getFuelGaugeRightIndex(plane)
    assert(plane)
    local burner = plane.burner
    if not burner or not burner.currently_burning then
        return 0
    end

    -- Remaining energy of burning fuel compared to the full energy of the burning fuel
    local remainingFuel = burner.remaining_burning_fuel / burner.currently_burning.name.fuel_value
    local index = math.floor(remainingFuel * (utility.UI_FUEL_R_NEEDLE_COUNT - 1) + 0.5)

    -- Clamp to range
    if index < 0 then
        index = 0
    elseif index >= utility.UI_FUEL_R_NEEDLE_COUNT then
        index = utility.UI_FUEL_R_NEEDLE_COUNT - 1
    end

    return index
end

-- Gets speed gauge sprite index, the UI needle points to the provided value
local function getSpeedGaugeIndex(speed)
    -- Speed of vehicle devided by 4 since we have 400 needle positions out of 1600 ticks on the gauge
    local index = math.floor(math.abs(speed) / 4 + 0.5)

    -- Clamp to range
    if index < 0 then
        index = 0
    elseif index >= utility.UI_SPEED_NEEDLE_COUNT then
        index = utility.UI_SPEED_NEEDLE_COUNT - 1
    end

    return index
end

-- UI logic

-- Gets LuaGuiElement for gauges (no needles), creates it if not exist
local function getGaugeGui(player)
    assert(player)
    local frameGuiElement = mod_gui.get_frame_flow(player)

    local gaugeGuiElement = frameGuiElement[utility.UI_GAUGE_FRAME]
    if not gaugeGuiElement then
        gaugeGuiElement = frameGuiElement.add{
            type      = "frame",
            name      = utility.UI_GAUGE_FRAME,
            direction = "horizontal"
        }
    end

    local fuelIndicator = gaugeGuiElement[utility.UI_FUEL_FRAME]
    if not fuelIndicator then
        gaugeGuiElement.add{
            type   = "sprite",
            name   = utility.UI_FUEL_FRAME,
            sprite = utility.UI_FUEL_FRAME_SPRITE
        }
    end

    local speedIndicator = gaugeGuiElement[utility.UI_SPEED_FRAME]
    if not speedIndicator then
        gaugeGuiElement.add{
            type   = "sprite",
            name   = utility.UI_SPEED_FRAME,
            sprite = utility.UI_SPEED_FRAME_SPRITE
        }
    end
    return gaugeGuiElement
end

-- Removes LuaGuiElement for gauges if it exists
local function deleteGauges(player)
    local frameGuiElement = mod_gui.get_frame_flow(player)
    local gaugeGuiElement = frameGuiElement[utility.UI_GAUGE_FRAME]
    if gaugeGuiElement then
        gaugeGuiElement.destroy()
    end
end

-- Updates the sprite on a gauge, if it does not exist, it is created
local function updateGaugeOverlay(baseGauge, overlayName, spriteName)
    assert(baseGauge)
    assert(overlayName)
    assert(spriteName)
    if baseGauge[overlayName] then
        baseGauge[overlayName].sprite = spriteName
    else
        baseGauge.add{
            type   = "sprite",
            name   = overlayName,
            sprite = spriteName
        }
    end
end

-- Updates the speed and fuel gauge arrows
local function updateGaugeArrows(player, plane)
    assert(player)
    assert(plane)
    local gauges = getGaugeGui(player)

    -- Takeoff and landing speed indicator
    local transitionSpeed = utility.fromFactorioUnitUser(player, utility.getTransitionSpeed(plane.prototype.name))
    local currentSpeed = utility.fromFactorioUnitUser(player, plane.speed)
    local airspeedGauge = gauges[utility.UI_SPEED_FRAME]
    updateGaugeOverlay(
        airspeedGauge,
        utility.UI_SPEEDW_NEEDLE,
        utility.UI_SPEEDW_NEEDLE_SPRITE_PREFIX .. getSpeedGaugeIndex(transitionSpeed)
    )
    updateGaugeOverlay(
        airspeedGauge,
        utility.UI_SPEED_NEEDLE,
        utility.UI_SPEED_NEEDLE_SPRITE_PREFIX .. getSpeedGaugeIndex(currentSpeed)
    )

    -- Fuel and fuel remaining in currently burning fuel
    local fuelPercentage = getFuelPercentage(plane)
    local fuelGauge = gauges[utility.UI_FUEL_FRAME]
    updateGaugeOverlay(
        fuelGauge,
        utility.UI_FUEL_L_NEEDLE,
        utility.UI_FUEL_L_NEEDLE_SPRITE_PREFIX .. getFuelGaugeLeftIndex(fuelPercentage)
    )
    updateGaugeOverlay(
        fuelGauge,
        utility.UI_FUEL_R_NEEDLE,
        utility.UI_FUEL_L_NEEDLE_SPRITE_PREFIX .. getFuelGaugeRightIndex(plane)
    )

    -- Show fuel warning light when fuel is below set percentage
    if (fuelPercentage * 100) <= settings.get_player_settings(player)[utility.SU_LOW_FUEL_WARN_THRESHOLD].value then
        updateGaugeOverlay(fuelGauge, utility.UI_FUELW, utility.UI_FUELW_SPRITE)
    else
        updateGaugeOverlay(fuelGauge, utility.UI_FUELW, "")
    end
end

-- Events

local function onTick(e)
    for index, player in pairs(game.connected_players) do
        -- Creates, updates, or deletes the gauges depending on player settings
        if player.driving and player.vehicle and utility.isPlane(player.vehicle.prototype.name) then
            if settings.get_player_settings(player)[utility.SU_ENABLE_GAUGES].value then
                updateGaugeArrows(player, player.vehicle)
            else
                deleteGauges(player)
            end

            local fuelPercentage = getFuelPercentage(player.vehicle)
            if settings.get_player_settings(player)[utility.SU_LOW_FUEL_WARN].value and
                (fuelPercentage * 100) <= settings.get_player_settings(player)[utility.SU_LOW_FUEL_WARN_THRESHOLD].value then
                -- Only play sounds every 15 ticks to avoid overlay
                -- Only when when faster than 10km/h to avoids warning when entering newly built plane
                if e.tick % 15 == 0 and player.vehicle.speed > (10 * utility.KPH2MPT) then
                    player.play_sound({path=utility.UI_WARNING_SOUND})
                end
            end
        else
            deleteGauges(player)
        end
    end
end

local handlers = {}
handlers[defines.events.on_tick] = onTick
return handlers