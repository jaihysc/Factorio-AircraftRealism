# Adding new planes

*Written with version 1.5.0*

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

### makeGrounded

```c++
void makeGrounded(Table config)
```

| Config member     | Type      | Documentation                                                                     |
|-------------------|-----------|-----------------------------------------------------------------------------------|
| prototype         | prototype | Your plane prototype, already registered to global table data                     |

```lua
-- Example
local aircraftMaker = require("__AircraftRealism__.aircraftMaker")
local groundedCar = data.raw["car"]["car"]
aircraftMaker.makeGrounded({prototype=groundedCar})
```

### makeAirborne

```c++
Prototype makeAirborne(Table config)
```

| Config member           | Type             | Documentation                                                                                                   |
|-------------------------|------------------|-----------------------------------------------------------------------------------------------------------------|
| name                    | string           | Prototype name used in makeGrounded                                                                             |
| shadow?                 | table            | Define to enable to plane to have animated shadows                                                              |
| shadow.filename         | string           | Filename to shadow spritesheet of the plane                                                                     |
| shadow.width            | number           | Number of pixels for each sprite direction within the spritesheet (width)                                       |
| shadow.height           | number           | Number of pixels for each sprite direction within the spritesheet (height)                                      |
| shadow.lineLength       | number           | Number of directions per row within the spritesheet                                                             |
| shadow.directionCount   | number           | Number of directions in total on the spritesheet                                                                |
| shadow.shift?           | {number, number} | **Default: {0, 0}** Same as Factorio [sprite.shift](https://wiki.factorio.com/Types/Sprite#shift)               |
| shadow.scale?           | number           | **Default: 1** Same as Factorio [sprite.scale](https://wiki.factorio.com/Types/Sprite#scale)                    |
| shadow.endSpeed         | number           | Speed after plane transition speed to end the shadow animation *(tiles/tick)*. Watch your units.                |
| shadow.tileOffsetFinal? | {number, number} | **Default: {50, 20}** The shadow will move from its initial position to this at the end of the shadow animation |
| shadow.renderLayer?     | string           | **Default: "smoke"** One of [Types/Renderlayer](https://lua-api.factorio.com/latest/Concepts.html#RenderLayer)  |
| shadow.alphaInitial?    | number           | **Default: 0.5** Shadow tint begins with this alpha and falls to 0                                              |

```lua
-- Example
local aircraftMaker = require("__AircraftRealism__.aircraftMaker")
local gunship = aircraftMaker.makeAirborne({
    name="gunship",
    shadow={
        filename="__Aircraft__/graphics/entity/gunship/gunship_spritesheet-shadow.png",
        width = 224,
        height = 224,
        shift = util.by_pixel(54, 35),
        lineLength = 6,
        directionCount = 36,
        endSpeed = 40 / 216
    }
})
```

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

[mod-setting-description]
aircraft-takeoff-speed-<yourPlaneName>=Speed to takeoff and be airborne, no longer colliding with anything
```

## Example

Turn the vanilla car into a flying one.
See `FlyingCar_0.1.0`, works as a standalone mod.
