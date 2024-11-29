# Factorio-AircraftRealism

Planes possess collisions and now needs to reach set speeds to takeoff. To customize your experience, a range of mechanics are provided, they are listed below.

## Installation

This mod includes no planes by itself, you must install them separately. A non-exhaustive list of aircraft mods is listed
- [Aircraft](https://mods.factorio.com/mods/SuicidalKid/Aircraft)
- [King Jo's B-17](https://mods.factorio.com/mod/kj_b17)
- [KM A-10 ThunderBolt](https://mods.factorio.com/mod/km_a10)

## Mechanics

Planes are grounded by default need to reach their set takeoff speed to takeoff, after which they will become airborne and lose their collisions. To land, slow down below their set landing speed, after which it becomes grounded and gains its collisions.

Should the pilot bail while the plane is airborne, if there is a passenger available, they will become the pilot instead.

_Takeoff/landing speed, units can be modified in the in-game mod menu_

## User Interface

Estimate the takeoff distance of your plane by clicking the shortcut "Estimate takeoff distance" to the right of your toolbar and hover your cursor over your plane. If the takeoff distance could not be determined, an orange line is drawn to indicate error. If a non-runway tile is encountered, a red circle is drawn around that tile.

[Takeoff distance estimation](https://i.imgur.com/5wyIPr0.mp4)

Gauges appear at the top left of the screen, they convey the following information

| Fuel gauge | Description |
| - | - |
| Left fuel bar | Remaining fuel in the aircraft tank |
| Right fuel bar | Remaining energy in currently burning fuel item |
| Red light | Turns on when remaining fuel in tank is below set threshold, sounds warning chime |

| Speed gauge | Description |
| - | - |
| White needle | Plane speed in your chosen unit (km/h or mph) |
| Red needle | Plane takeoff or landing speed in your chosen unit (km/h or mph) |

_Enable/disable gauge + warning chime, warning threshold, units can be modified in the in-game mod menu_

## Optional Mechanics

| Name | Description |
| - | - |
| Runway requirement\* | Runway tiles are tiles with a vehicle friction modifier less than what is set in the settings. When not on a runway tile, the max speed of the plane is limited to what is set in the settings - exceeding the max speed when not on a runway will damage the plane. <br> _Enable/disable, Max vehicle friction modifier for tiles, max speed when not on runway can be modified in the in-game mod menu_ |
| Deadly environmental impacts\* | Hitting cliffs and running into water on takeoff and landing will destroy the plane. Otherwise the plane just stops. <br> _Enable/disable in the in-game mod menu_ |
| Pollution\* | Planes emit pollution depending on their fuel type and speed. <br> _Enable/disable, pollution amount can be modified in the in-game mod menu_ |
| Airborne damage immunity\* | Airborne planes take no damage, if you are tired of biters destroying your planes (or you wish to use [nuclear weapons](https://mods.factorio.com/mod/True-Nukes) without blowing yourself up) <br> _Enable/disable in the in-game mod menu_ |
| \* Disabled by default. |  |

## Mod Internals

For implementations of features and possible issues, see [here](Docs/ScriptImplementation.md) for an up-to-date document.

It is possible to add your own planes using this mod, see [here](Docs/AddingNewPlanes.md).

## Credits

Thank you to everyone on the forums for reporting issues and offering suggestions.

| Name | Description |
| - | - |
| Thomasnotused | Aircraft (original inspiration for this mod) and part of the plane icon seen in the thumbnail |
| Snouz | Optimized sprites |
| TheKingJo | German locale |

Finally, thank you for using this mod!