require("mod-gui")
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

    -- Find the aircraft gauge elemen
    -- gui_elements["aircraft-realism-gauge-frame"]

    for i,element in pairs(gui_elements.children) do
        if element.name == "aircraft-realism-gauge-frame" then
            return element
        end
    end
end


local function getFuelGaugeLeftIndex(player, game)
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

    local fuelPercentage = countedFuelValue / maxFuelValue * 100
    return utils.roundNumber(fuelPercentage * 31 / 100) -- Convert 0 - 100 to 0 - 31
end

local function getFuelGaugeRightIndex(player)
    --Remaining energy of burning fuel compared to the full energy of the burning fuel
    local remainingBurningFuel = player.vehicle.burner.remaining_burning_fuel / player.vehicle.burner.currently_burning["fuel_value"] * 100
    return utils.roundNumber(remainingBurningFuel * 30 / 100)
end

local function deleteGauges(player)
    local gauge = getGaugeGui(player)
    if gauge then
        gauge.destroy()
    end
end

-- Converts km or mph to an index on the speed gauge
local function toSpeedGaugeIndex(speed, settings, inFactorioUnits)
    -- Speed of vehicle devided by 4 since we have 400 needle positions out of 1600 on the gauge
    if inFactorioUnits then
        speed = utils.fromFactorioUnit(settings, speed)
    end
    return math.abs(utils.roundNumber(speed / 4))
end


-- Gets the takeoff speed if the plane is grounded, landing speed if plane is airborne -> km/h or mph speed
local function getTakeoffLandingSpeed(player, settings)

    if planeUtils.isGroundedPlane(player.vehicle.name) then
        return settings.global["aircraft-takeoff-speed-" .. player.vehicle.name].value

    elseif planeUtils.isAirbornePlane(player.vehicle.name) then
        -- Chop off the -airborne at the end to get the landing speed of the plane
        return settings.global["aircraft-landing-speed-" .. string.sub(player.vehicle.name, 0, string.len(player.vehicle.name) - string.len("-airborne"))].value

    end
end

--Updates the speed and fuel gauge arrows
local function updateGaugeArrows(player, settings, game)
    if not player.vehicle then
        return
    end

    local gauges = getGaugeGui(player)


    -- Airspeed
    local airspeedGauge = gauges["aircraft-realism-airspeed-indicator-base"]
    airspeedGauge.clear()

    airspeedGauge.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-needle",
        sprite = "aircraft-realism-airspeed-indicator-" .. toSpeedGaugeIndex(player.vehicle.speed, settings, true)
    }
    --Takeoff and landing speed indicator
    airspeedGauge.add{
        type = "sprite",
        name = "aircraft-realism-airspeed-indicator-warning-needle",
        sprite = "aircraft-realism-airspeed-indicator-warning-" .. toSpeedGaugeIndex(getTakeoffLandingSpeed(player, settings), settings, false)
    }

    -- Fuel
    local fuelGauge = gauges["aircraft-realism-fuel-indicator-base"]
    fuelGauge.clear()

    -- Gets the amount of fuel remaining in the fuel inventory compared to the max inventory size
    local fuelLeftGaugeIndex = getFuelGaugeLeftIndex(player, game)
    fuelGauge.add{
        type = "sprite",
        name = "aircraft-realism-fuel-indicator-left-bar",
        sprite = "aircraft-realism-fuel-indicator-left-" .. fuelLeftGaugeIndex
    }

    local fuelRightGaugeIndex = getFuelGaugeRightIndex(player)
    fuelGauge.add{
        type = "sprite",
        name = "aircraft-realism-fuel-indicator-right-bar",
        sprite = "aircraft-realism-fuel-indicator-right-" .. fuelRightGaugeIndex
    }
end

-- Return all the functions for gui back to control
functions.initializeGauges = initializeGauges
functions.deleteGauges = deleteGauges
functions.updateGaugeArrows = updateGaugeArrows

return functions