-------------------------------
---- CAU'S HYPRLAND CONFIG ----
-------------------------------
--  Refer to the wiki for more information.
--  https://wiki.hypr.land/Configuring/Start/
--  Please note not all available settings / options are set here.
--  For a full list, see the Hyprland wiki
--  This configuration is split into multiple files and meant to provide a comfortable level of defaults.
--  To edit it, simply edit the ones provided in ~/.config/hypr/config/*
--  (I HIGHLY encourage you to personalize this config!)

-- DO NOT POLLUTE THIS FILE!

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
require("config/monitor")
require("config/environment_variables")
require("config/autostart_commands")
require("config/permissions")
require("config/look_and_feel")
require("config/input")
require("config/keybinds")
require("config/window_and_layer_rules")