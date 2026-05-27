-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        -- Whichever way your bar is facing, add 1 to prevent border cutoff (for me it is the bottom, thus the third number is 2)
        -- clockwise [top,right,bottom,left]
        gaps_out = 1,1,2,1,

        border_size = 5,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types for info about colors
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 30 },
            inactive_border = { colors = {"rgba(595959aa)", "rgba(ff323255)"}, angle = 30 },
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        extend_border_grab_area = 5,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling",

        -- Snap windows to other windows and screen edges/quickshell bar when close enough:
        snap = {
            window_gap = 25,
            monitor_gap = 25,
            enabled = true,
            respect_gaps = true,
        },
    },

    decoration = {
        rounding       = 20,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.97,
        inactive_opacity = 0.9,

        -- Window shadow:
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0x1aff9aff,
        },

        blur = {
            enabled   = true,
            size      = 8,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- These are slightly modified from default curves and springs, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.46, 1} }     })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} }     })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    }     })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} }     })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  }     })

-- Springs
hl.curve("relaxed",        { type = "spring", mass = 1, stiffness = 56, dampening = 14 })
hl.curve("snappy",         { type = "spring", mass = 1, stiffness = 86, dampening = 17 })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default"                           })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint"                      })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "snappy"                            })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 2.1,  spring = "relaxed",      style = "gnomed"    })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, spring = "relaxed",      style = "gnomed"    })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 5.13, bezier = "almostLinear"                      })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 2.96, bezier = "almostLinear"                      })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick"                             })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint"                      })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade"      })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade"      })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear"                      })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear"                      })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3.94, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2.21, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.94, bezier = "almostLinear", style = "slidefade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick"                             })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Set the first 10 workspaces to always show, even if empty. If you don't want this, disable it or modify it, also check the autostart section.
hl.workspace_rule({ workspace = "r[1-10]", persistent = true })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 1,
        focus_fit_method = 0,
        follow_focus = true,
        follow_min_visible = 1,
        explicit_column_widths = "0.333, 0.5, 0.667, 0.9, 1.0",
        wrap_focus = false,
        wrap_swapcol = false,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
        middle_click_paste = false, -- Disable middle click to paste

        -- What FPS to render occluded windows at, set this to your refresh rate or something below it.
        -- This will ONLY do anything, if such a window is given a rule to do so, otherwise this setting does nothing.
        render_unfocused_fps = 75,
    },
})
