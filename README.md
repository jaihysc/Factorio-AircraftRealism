# Factorio-AircraftRealism

Adds a variety of mechanics to make vehicles behave like planes.

Originally an extension to the [Aircraft mod](https://github.com/Stifling-Bossness/Aircraft) for Factorio, now a framework for planes.

![](https://i.imgur.com/eGXdOQv.png)

## Table of Contents
1. [Main mechanics](#main-mechanics)
2. [Optional mechanics](#optional-mechanics)
3. [Mod internals](#mod-internals)
4. [Credits](#credits)

## Main mechanics

**This mod includes no planes by itself, you must install them separately.**

Some aircraft mods are listed below:
- [Aircraft](https://mods.factorio.com/mods/SuicidalKid/Aircraft)
- [King Jo's B-17](https://mods.factorio.com/mod/kj_b17)
- [King Jo's Northrop B-2 Spirit](https://mods.factorio.com/mod/kj_b2)

### Takeoff and landing

Planes need to reach their set takeoff speed to takeoff, after which they will become airborne and lose their collisions. To land, slow down below their set landing speed, after which it becomes grounded and gains its collisions.

Should the pilot bail while the plane is airborne, if there is a passenger available, they will become the pilot instead. Otherwise the plane will be destroyed. On the ground, the pilot cannot exit unless the plane is stopped.

_Takeoff/landing speed, units can be modified in the ingame mod menu_

### Gauges

Fuel gauge

* Left fuel bar: Remaining fuel in the aircraft tank
* Right fuel bar: Remaining energy in currently burning fuel item
* Red light: Turns on when remaining fuel in tank is below set threshold, sounds warning chime

Speed gauge

* White needle: Plane speed
* Red needle: Plane takeoff or landing speed

_Enable/disable gauge + warning chime, warning threshold, units can be modified in the ingame mod menu_

## Optional mechanics

### Auto reaccelerate to keep airborne

To reduce accidental landings, unless the brake is held the plane will automatically reaccelerate to keep itself airborne.

Throttle lever coming in the future, allowing a set speed to be maintained.

_Enable/disable in the ingame mod menu_

### Strict runway requirement [Default: Disabled]

Runway tiles are tiles with a vehicle friction modifier less than what is set in the settings. When not on a runway tile, the max speed of the plane is limited to what is set in the settings - exceeding the max speed when not on a runway will damage the plane.

_Enable/disable, Max vehicle friction modifier for tiles, max speed when not on runway can be modified in the ingame mod menu_

### Environmental damage [Default: Disabled]

Not recommended for now, the detection is somewhat inaccurate and sometimes falsely destroys the plane.

Hitting cliffs and running into water on takeoff and landing will destroy the plane. Otherwise the plane just stops.

_Enable/disable in the ingame mod menu_

### Pollution [Default: Disabled]

Planes emit pollution depending on their fuel type and speed.

_Enable/disable, pollution amount can be modified in the ingame mod menu_

### Realistic turn radius

Widens the turn radius of planes; planes can no longer spin on the spot.

_Enable/disable in the ingame mod menu_

### Realistic acceleration + braking force [Default: Disabled]

Slower acceleration and braking, requiring a greater distance to takeoff and land.

_Enable/disable in the ingame mod menu_

### Increase debris damage [Default: Disabled]

Rocks, tree stumps and other objects will damage the plane more on takeoff and landing.

_Enable/disable in the ingame mod menu_

### No airborne plane shadows

Planes will lose their shadows upon taking off.

_Enable/disable in the ingame mod menu_

### Fuel usage multiplier

Modify how much fuel grounded and airborne planes use.

_Fuel usage can be modified in the ingame mod menu_

## Mod internals

### How the mod works

To give the illusion of taking off and landing, the mod makes a copy of the plane - one plane is the grounded version, the other is the airborne version. The grounded version of the plane possesses collisions, while the airborne version does not. When the player passes takeoff speed, the airborne version of the plane is created and everything from the old grounded plane is copied over. When the player lands, the same process occurs into a grounded plane from an airborne plane.

The mod determines whether or not a vehicle is a plane using the prototype property `order`. The mod appends `-__Z9ZC_G` for grounded planes and `-__Z9ZC_A` for airborne planes.

Increased debris damage is accomplished by halving the health of the plane when it is on the ground, therefore damage is 2x more powerful.

### Possible issues

Because the mod copies the grounded version of the plane for the airborne version, one must **ensure that the grounded version of the plane is not modified** after this mod takes a copy. That means loading this mod after any other mod which modifies planes.

Because the mod determines whether or not a vehicle is a plane using the prototype property `order`, **the ending must not be changed**. Example below:
```
aabbccdd-__Z9ZC_G         OK order (Recognized as a plane)
abcdefghijkl-__Z9ZC_A     OK order (Recognized as a plane)
aabbccdd-__Z9ZC_G-aabb    BAD order (Will not be recognized as a plane)
llvmcppc__Z9ZC_A-gcc      BAD order (Will not be recognized as a plane)
```

### Adding custom planes

It is possible to add your own planes using this mod, see [here](https://github.com/jaihysc/Factorio-AircraftRealism/blob/master/Docs/AddingNewPlanes.md).

## Credits

Thank you to everyone on the forums for reporting issues and offering suggestions.

- SuicidalKid - Part of the plane icon seen in the thumbnail
- TheKingJo - German locale

Finally, thank you for using this mod!