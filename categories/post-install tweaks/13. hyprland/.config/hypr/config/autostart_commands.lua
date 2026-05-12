-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function ()
    -- This bit starts systemd graphical target management which will neatly pull in the rest of the things that depend on it.
    -- Do not modify this.
    hl.exec_cmd("dbus-update-activation-environment --systemd --all; systemctl --user start hyprland-session-ready.service")
end)
-- Or every config reload like this:
hl.on("config.reloaded", function ()
    -- This bit just spawns 10 workspaces and lastly lands us on the first one, you may modify this as you wish.
    hl.exec_cmd("hyprctl dispatch \'hl.dsp.focus({ workspace = \"2\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"3\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"4\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"5\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"6\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"7\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"8\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"9\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"10\" })' && hyprctl dispatch \'hl.dsp.focus({ workspace = \"1\" })'")
end)
