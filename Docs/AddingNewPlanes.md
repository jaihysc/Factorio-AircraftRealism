# Adding new planes

*Written on June 29, 2021 with version 1.3.0*

To support taking off / landing, you must create 2 versions of your plane.
The first version is the landed version, the second is airborne.

## Accessing functions

```lua
local aircraftMaker = require("__AircraftRealism__.aircraftMaker")
aircraftMaker.<your desired function>
```

## Reserved prototype members

Reserved for internal use, do not modify them when after calling makeGrounded()

| Prototype member               |
|--------------------------------|
| collision_mask                 |
| consumption                    |
| effectivity                    |
| name                           |
| max_health                     |
| order                          |
| repair_speed_modifier          |
| tank_driving                   |

## Plane creation

Can be called from data.lua, data-updates.lua, or data-final-fixes.lua.

makeGrounded must be called before makeAirborne.

```c++
void      makeGrounded(Table config)
Prototype makeAirborne(Table config)
```
| Config member     | Type      | Documentation                                                                     |
|-------------------|-----------|-----------------------------------------------------------------------------------|
| name              | string    | makeAirborne only: Prototype name used in makeGrounded                            |
| prototype         | prototype | makeGrounded only: Your plane prototype, already registered to global table data  |

## Global user settings

Adjust the behavior your plane based on user configuration values such as realistic turn radius, acceleration, ...

```c++
Table getSettings()
```

The values of all members is a true/false.

| Member            | Recommended changes to apply                                                             |
|-------------------|------------------------------------------------------------------------------------------|
| noAerialShadow    | Remove shadows from airborne plane                                                       |
| rAcceleration     | Increase prototype weight. Reduce prototype friction for gliding                         |
| rBraking          | Reduce braking power                                                                     |
| rTurnRadius       | Decrease prototype rotation_speed                                                        |

## Per plane user settings

Add settings in settings.lua, settings-updates.lua, or settings-final-fixes.lua

`<yourPlaneName>` is the prototype name of your plane

```lua
data:extend({
    {
        type = "double-setting",
        name = "aircraft-takeoff-speed-<yourPlaneName>",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 110,
    },
    {
        type = "double-setting",
        name = "aircraft-landing-speed-<yourPlaneName>",
        setting_type = "runtime-global",
        minimum_value = 0,
        default_value = 60,
    },

    -- ...
})
```

## Localization

Your plane prototype is duplicated for the airborne version, possessing the suffix `-airborne`

`<yourPlaneName>` is the prototype name of your plane

```ini
[entity-name]
<yourPlaneName>=Your Plane Name
<yourPlaneName>-airborne=Your Plane Name

[entity-description]
<yourPlaneName>=Description of your plane
<yourPlaneName>-airborne=Description of your plane

[mod-setting-name]
aircraft-takeoff-speed-<yourPlaneName>=Takeoff speed
aircraft-landing-speed-<yourPlaneName>=Landing speed

[mod-setting-description]
aircraft-takeoff-speed-<yourPlaneName>=Speed to takeoff and be airborne, no longer colliding with anything (Should be greater than the landing speed)

aircraft-landing-speed-<yourPlaneName>=Speed to land, no longer airborne and has collision with other objects (Should be less than the takeoff speed)
```

## Example

Turn the vanilla car into a flying one.
See `FlyingCar_0.1.0`, works as a standalone mod.
