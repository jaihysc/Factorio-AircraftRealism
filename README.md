# Factorio-AircraftRealism

Planes possess collisions and now needs to reach set speeds to takeoff. To customize your experience, a range of mechanics are provided, they are listed below.

## Installation

This mod includes no planes by itself, you must install them separately. A non-exhaustive list of aircraft mods is listed
- [Aircraft](https://mods.factorio.com/mods/SuicidalKid/Aircraft)
- [King Jo's B-17](https://mods.factorio.com/mod/kj_b17)
- [King Jo's Northrop B-2 Spirit](https://mods.factorio.com/mod/kj_b2)

## Mechanics

Planes are grounded by default need to reach their set takeoff speed to takeoff, after which they will become airborne and lose their collisions. To land, slow down below their set landing speed, after which it becomes grounded and gains its collisions.

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

## Mod Internals

For implementations of features and possible issues, see [here](Docs/ScriptImplementation.md) for an up to date document.

It is possible to add your own planes using this mod, see [here](Docs/AddingNewPlanes.md).

## Credits

Thank you to everyone on the forums for reporting issues and offering suggestions.

- SuicidalKid - Part of the plane icon seen in the thumbnail
- TheKingJo - German locale

Finally, thank you for using this mod!