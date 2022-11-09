# Script Implementation

This document describes how the Lua scripting is structured in this mod.

## Modules

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
