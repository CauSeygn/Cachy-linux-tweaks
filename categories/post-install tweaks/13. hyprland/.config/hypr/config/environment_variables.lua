-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- These set cursor size and theme, if you want to change them, use KDE System Settings to figure out quickly what sizes they come in and look in /usr/share/icons/ to quickly determine the internal names of them (the folder names).
-- Lastly, modify the `Inherits=` line content in ~/.local/share/icons/default/index.theme to reflect your new choice.
hl.env("XCURSOR_SIZE", "36")
hl.env("HYPRCURSOR_SIZE", "36")
hl.env("XCURSOR_THEME", "capitaine-cursors-light")

-- QT apps will attempt to launch in their wayland backend.
hl.env("QT_QPA_PLATFORM", "wayland")

-- Theme QT apps like this:
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- This is needed to correctly build application cache for KDE apps.
hl.env("XDG_MENU_PREFIX", "plasma-")

-- Set GTK stuff, theme should match the theme name in .config/gtk-{3,4}.0/.
hl.env("GTK_THEME", "Breeze-Dark")
hl.env("GTK_USE_PORTAL", "1")

-- XDG stuff.
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- This is needed for nVidia dual GPU laptop users, remove this if you don't use an nVidia laptop with dual GPUs.
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")