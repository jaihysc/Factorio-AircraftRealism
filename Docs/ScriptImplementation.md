# Script Implementation

## Operation

To give the illusion of taking off and landing, the mod uses two planes one plane is the grounded version, the other is the airborne version. The grounded version of the plane possesses collisions, while the airborne version does not. When the player passes takeoff speed, the airborne version of the plane is created and everything from the old grounded plane is copied over. When the player lands, the same process occurs into a grounded plane from an airborne plane.

The information about planes is stored in a lua table. To allow the table created during the data stage to be read during runtime - we create a prototype, serialize the table, and store the serialized table in the prototype property `order`. Since Factorio limits the maximum length of the string to 200 characters, we split the string across several prototypes and recombine the string when loading.

## Lua structure

The different modules of the mod are stored under `logic/`, each its own file. The file `utility.lua` is a exception and implements general functions reused throughout the modules.

When the modules are required, they return a table containing a list of keys of Factorio defines for events, e.g., `defines.events.on_tick` mapping to a function which is the event handler. The code in `control.lua` dispatches the events appropriately to all the event handlers of the modules.

Example of a table returned:
```lua
local function f()
end

local table = {}
table[defines.events.on_tick] = f
```
