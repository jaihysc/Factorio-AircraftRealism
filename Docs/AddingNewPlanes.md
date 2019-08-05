# Adding new planes

*Written on August 2, 2019 with version 0.2.0*

Settings menu are automatically handled using the provided functions in each file

*yourModName* is name of your mod

*yourPlaneName* is name of your plane

## In data.lua, 

Modify the plane using the **ExtendGroundedAircraft()** function provided

```
if mods["yourModName"] then
    ExtendGroundedAircraft(...)
end
```

## In airbornePlanes.lua, 

Use **ExtendAirborneAircraft()** to set the plane's airborne properties, add

```
if mods["yourModName"] then
    ExtendAirborneAircraft(...)
end
```

## In definitions/recognisedPlanes.lua, 

Add the entity name of the plane to the **recognisedPlanes** array

## In settinga.lua

Add the settings entries for the plane,

```
if mods["yourModName"] then
    data.extend({
        {
            type = "double-setting",
            name = "aircraft-takeoff-speed-yourPlaneName",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 110,
            order="ada" --Change this order to make it appear before or after a option
        },
        {
            type = "double-setting",
            name = "aircraft-landing-speed-yourPlaneName",
            setting_type = "runtime-global",
            minimum_value = 0,
            default_value = 60,
            order="bda"
        },
    })
end
```

## In config.cfg

Add the localized names of the planes

```
[entity-name]
yourPlaneName-airborne=Your Plane Name

[entity-description]
yourPlaneName-airborne=Description of your plane

[mod-setting-name]
aircraft-takeoff-speed-yourPlaneName=Speed to takeoff and be airborne, no longer colliding with anything (Should be greater than the landing speed)

[mod-setting-description]
aircraft-landing-speed-yourPlaneName=Speed to land, no longer airborne and has collision with other objects (Should be less than the takeoff speed)

```