# Adding new planes

*Written with version 2.0.0*

The API has changed in 2.0.0, the API only informs AircraftRealism of 2 vehicles behaving as the grounded/airborne versions of a plane. AircraftRealism no longer modifies the planes you provide.

## Quickstart

To support taking off / landing, there 2 versions of your plane - the grounded and airborne version. You must create these 2 planes and tell AircraftRealism.

The takeoff / landing speed is player configurable, thus you need to provide the name of the setting.

```lua
-- File: data.lua
-- We turn the vanilla car into a plane, we copy the car for the airborne version and tell the API
-- The API needs the setting name for the takeoff/landing speed, the "transition speed"
local api = require("__AircraftRealism__.api")

local car_flying = table.deepcopy(data.raw.car["car"])
car_flying.name  = "car-flying"
data:extend{car_flying}

api.register_plane({
    grounded_name="car",
    airborne_name="car-flying",
    transition_speed_setting="transition-speed-car",
})

-- Modify the prototypes as required (such collision_mask for no airborne collisions)
-- ...
```

```lua
-- File: settings.lua
-- Define the transition speed for the plane, the unit is either in km/h or mile/h based on what the user choose
-- in the AircraftRealism settings
data:extend({
    {
        type = "double-setting",
        name = "transition-speed-car",
        setting_type = "runtime-global",
        minimum_value = 10,
        maximum_value = 200,
        default_value = 90,
    }
})
```

[Full API documentation](./Api.md)
