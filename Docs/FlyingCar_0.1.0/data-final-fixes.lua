local aircraftMaker = require("__AircraftRealism__.aircraftMaker")


local userSettings = aircraftMaker.getSettings()

local prototypeName = "car"
local groundedCar = data.raw["car"][prototypeName]

-- Apply global user settings to grounded car
if userSettings.rAcceleration then
    groundedCar.weight = 2000
end
if userSettings.rBraking then
    groundedCar.braking_power = "300kW"
end
if userSettings.rTurnRadius then
    groundedCar.rotation_speed = 0.05;
end

-- Plane creation
aircraftMaker.makeGrounded({prototype=groundedCar})
local airborneCar = aircraftMaker.makeAirborne({name=prototypeName})

-- Apply global user settings to airborne car
if userSettings.rAcceleration then
    airborneCar.weight = 3000
    airborneCar.friction = 0.001
end
if userSettings.rBraking then
    airborneCar.braking_power = "100kW"
end
if userSettings.rTurnRadius then
    airborneCar.rotation_speed = 0.008;
end