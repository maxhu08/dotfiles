local configDir = os.getenv("HOME") .. "/.config/hypr"

dofile(configDir .. "/conf/programs.lua")
dofile(configDir .. "/conf/startup.lua")
dofile(configDir .. "/conf/env.lua")
dofile(configDir .. "/conf/input.lua")
dofile(configDir .. "/conf/appearance.lua")
dofile(configDir .. "/conf/layouts.lua")
dofile(configDir .. "/conf/keybinds.lua")
dofile(configDir .. "/conf/windowrules.lua")
dofile(configDir .. "/conf/misc.lua")




-- CHANGE THESE TO MATCH YOUR MONITOR SETUP
dofile(configDir .. "/conf/monitors.lua")
dofile(configDir .. "/conf/workspaces.lua")
