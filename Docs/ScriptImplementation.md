# Script Implementation

## Operation

To give the illusion of taking off and landing, the mod makes a copy of the plane - one plane is the grounded version, the other is the airborne version. The grounded version of the plane possesses collisions, while the airborne version does not. When the player passes takeoff speed, the airborne version of the plane is created and everything from the old grounded plane is copied over. When the player lands, the same process occurs into a grounded plane from an airborne plane.

The information about planes is stored in a lua table. To allow the table created during the data stage to be read during runtime - we create a prototype, serialize the table, and store the serialized table in the prototype property `order`. Since Factorio limits the maximum length of the string to 200 characters, we split the string across several prototypes and recombine the string when loading.

```lua
    -- Serialized table format
    {
        grounded = {
            "grounded-plane-name1"=1, -- Number is index into table "data"
            "grounded-plane-name2"=2,
            -- ...
        },
        airborne = {
            "airborne-plane-name1"=2,
            "airborne-plane-name2"=1,
            -- ...
        },
        data = {
            -- Lookup plane in grounded or airborne table for index into data table
            {
                -- Data for plane 1...
            },
            {
                -- Data for plane 2...
            },
            -- ...
        }
    }
    -- In the example above, grounded-plane-name1 and airborne-plane-name2 are linked together, with their data stored at index 1
```

Increased debris damage is accomplished by halving the health of the plane when it is on the ground, therefore damage is 2x more powerful.

## Possible issues

Because the mod copies the grounded version of the plane for the airborne version, one must **ensure that the grounded version of the plane is not modified** after this mod takes a copy. That means loading this mod after any other mod which modifies planes.

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

Graphical representation of data structure:
```
                 Require module 1  Require module 2 ...
                  |----------------|
                  v
Event table      [Event 1          Event 2]
                 |                 |
                 v                 v
                 [Event handlers] [Event handlers]
```
