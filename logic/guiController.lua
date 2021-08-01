local mod_gui = require("mod-gui")
local utils = require("logic.utility")
local planeUtils = require("logic.planeUtility")

local functions = {}

-- Draws the fuel and airspeed gauges withOUT needles on the hud
local function initializeGauges(player)
    local frame_flow = mod_gui.get_frame_flow(player)
    local aircraft_information_frame = frame_flow.add{
        type = "frame",
        name = "aircraft-realism-gauge-frame",
        direction = "horizontal"
    }
    local fuel_indicator = aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-fuel-indicator-base",
        sprite = "aircraft-realism-fuel-indicator-base"
    }
    local speed_indicator = aircraft_information_frame.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-base",
        sprite = "aircraft-realism-airspeed-indicator-base"
    }
end

local function getGaugeGui(player)
    local gui_elements = mod_gui.get_frame_flow(player)

    -- Find the aircraft gauge element
    -- gui_elements["aircraft-realism-gauge-frame"]

    for i,element in pairs(gui_elements.children) do
        if element.name == "aircraft-realism-gauge-frame" then
            return element
        end
    end
end

local function deleteGauges(player)
    local gauge = getGaugeGui(player)
    if gauge then
        gauge.destroy()
    end
end

--------------------
-- Fuel gauge
local function getFuelPercentage(player, game)
    assert(player.vehicle)
    local emptySlots = 0  -- Empty fuel inventory slots
    local totalSlots = player.vehicle.prototype.burner_prototype.fuel_inventory_size  -- Total fuel inventory slots

    local maxFuelValue = 0  -- Maximum possible fuel value with the current fuels, average with the current fuels for empty slots
    local countedFuelValue = 0  -- Total fuel value of all the items in the fuel inventory

    -- Index through each fuel inventory slot, get the fuel value of all the total items combined
    for i = 1, totalSlots, 1 do
        local burnerInventoryItem = player.vehicle.burner.inventory[i]

        if burnerInventoryItem and burnerInventoryItem.valid_for_read then
            local fuelValue = game.item_prototypes[burnerInventoryItem.name]["fuel_value"]

            -- Get and track the fuel values for the item
            maxFuelValue = maxFuelValue + (game.item_prototypes[burnerInventoryItem.name]["stack_size"] * fuelValue)
            countedFuelValue = countedFuelValue + (burnerInventoryItem.count * fuelValue)
        else
            emptySlots = emptySlots + 1
        end
    end

    if maxFuelValue == 0 then -- Return if fuel inventory is empty, else we get divide by 0
        return 0
    end

    -- If a slot is empty, its fuel value is average by the slots that does have fuel
    maxFuelValue = maxFuelValue + (maxFuelValue / (totalSlots - emptySlots) * emptySlots)

    return countedFuelValue / maxFuelValue * 100
end

local function getFuelGaugeLeftIndex(fuelPercentage)
    local index = utils.roundNumber(fuelPercentage * 31 / 100) -- Convert 0 - 100 to 0 - 31

    -- When switching out of modded fuels, the stack size can be larger than normal
    if index > 31 then
        index = 31
    end

    return index
end

local function getFuelGaugeRightIndex(player)
    assert(player.vehicle)
    if not player.vehicle.burner or not player.vehicle.burner.currently_burning then
        return 0
    end

    --Remaining energy of burning fuel compared to the full energy of the burning fuel
    local remainingBurningFuel = player.vehicle.burner.remaining_burning_fuel / player.vehicle.burner.currently_burning["fuel_value"] * 100
    local index = utils.roundNumber(remainingBurningFuel * 30 / 100)

    -- Guard against modded fuel values changing
    if index > 30 then
        index = 30
    end

    return index
end

--------------------
-- Speed gauge
-- Converts km or mph to an index on the speed gauge
local function toSpeedGaugeIndex(speed, settings, player, inFactorioUnits)
    -- Speed of vehicle devided by 4 since we have 400 needle positions out of 1600 on the gauge
    if inFactorioUnits then
        speed = utils.fromFactorioUnitUser(settings, player, speed)

    -- Not in factorio speed units, convert to user's measurement choice if global setting differs
    elseif settings.get_player_settings(player)["aircraft-realism-user-speed-unit"].value ~= settings.global["aircraft-speed-unit"].value then
        if settings.global["aircraft-speed-unit"].value == "imperial" then
            speed = speed * 1.609  -- To metric
        else
            speed = speed / 1.609  -- To imperial
        end
    end
    local index = math.abs(utils.roundNumber(speed / 4))

    -- Do not exceed 399 for index since that is the largest sprite
    if index > 399 then
        return 399
    end

    return index
end


-- Gets the takeoff speed if the plane is grounded, landing speed if plane is airborne -> km/h or mph speed
local function getTakeoffLandingSpeed(player, settings)
    assert(player.vehicle)
    if planeUtils.isGroundedPlane(player.vehicle.prototype.order) then
        return settings.global["aircraft-takeoff-speed-" .. player.vehicle.name].value

    elseif planeUtils.isAirbornePlane(player.vehicle.prototype.order) then
        -- Chop off the -airborne at the end to get the landing speed of the plane
        return settings.global["aircraft-landing-speed-" .. string.sub(player.vehicle.name, 0, string.len(player.vehicle.name) - string.len("-airborne"))].value

    end
end

-- Updates the sprite on a gauge, if it does not exist, it is created
local function updateGaugeOverlay(baseGauge, overlayName, spiteName)
    if baseGauge[overlayName] then
        baseGauge[overlayName].sprite = spiteName
    else
        baseGauge.add{
            type = "sprite",
            name = overlayName,
            sprite = spiteName
        }
    end
end

-- Updates the speed and fuel gauge arrows
local function updateGaugeArrows(tick, player, settings, game)
    if not player.vehicle then
        return
    end

    local gauges = getGaugeGui(player)

    -- If player enters the plane for the first time
    if not gauges then
        initializeGauges(player)
        gauges = getGaugeGui(player)
    end

    --------------------
    -- Airspeed
    local airspeedGauge = gauges["aircraft-realism-airspeed-indicator-base"]

    -- Takeoff and landing speed indicator
    updateGaugeOverlay(
        airspeedGauge,
        "aircraft-realism-airspeed-indicator-warning-needle",
        "aircraft-realism-airspeed-indicator-warning-" .. toSpeedGaugeIndex(getTakeoffLandingSpeed(player, settings), settings, player, false)
    )

    updateGaugeOverlay(
        airspeedGauge,
        "aircraft-realism-airspeed-indicator-needle", 
        "aircraft-realism-airspeed-indicator-" .. toSpeedGaugeIndex(player.vehicle.speed, settings, player, true)
    )

    --------------------
    -- Fuel
    local fuelGauge = gauges["aircraft-realism-fuel-indicator-base"]

    local fuelPercentage = getFuelPercentage(player, game)
    updateGaugeOverlay(
        fuelGauge,
        "aircraft-realism-fuel-indicator-left-bar",
        "aircraft-realism-fuel-indicator-left-" .. getFuelGaugeLeftIndex(fuelPercentage)
    )

    -- Fuel remaining in currently burning fuel
    updateGaugeOverlay(
        fuelGauge,
        "aircraft-realism-fuel-indicator-right-bar",
        "aircraft-realism-fuel-indicator-right-" .. getFuelGaugeRightIndex(player)
    )

    -- Show fuel warning light when fuel is below set percentage
    if fuelPercentage <= settings.get_player_settings(player)["aircraft-realism-user-low-fuel-warning-percentage"].value then
        updateGaugeOverlay(
            fuelGauge,
            "aircraft-realism-fuel-indicator-emergency-fuel-warning",
            "aircraft-realism-fuel-indicator-emergency-fuel-warning"
        )
        -- Only play sounds every 15 ticks to avoid overlay
        if tick % 15 == 0 then
            utils.playSound(settings, player, "aircraft-realism-sound-master-warning")
        end
    else
        updateGaugeOverlay(
            fuelGauge,
            "aircraft-realism-fuel-indicator-emergency-fuel-warning",
            ""
        )
    end
end

functions.deleteGauges = deleteGauges
functions.updateGaugeArrows = updateGaugeArrows

return functions