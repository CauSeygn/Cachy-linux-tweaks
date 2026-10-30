--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https = { //wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https = { //wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})
-- suppressMaximizeRule = { set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move = "20 monitor_h-120",
    float = true,
})

---------------------------------
---- INDIVIDUAL WINDOW RULES ----
---------------------------------

-- AIMP
hl.window_rule({
    name = "aimp-position",
    match = {
        initial_title = "AIMP",
    },
    move = {6, 6},
    size = {588, 1390},
    float = true,
})

-- Clipse
hl.window_rule({
    name = "clipse",
    match = {
        initial_class = "clipse",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.39)", "(monitor_h*0.9)"},
})

-- Emoji Selector
hl.window_rule({
    name = "emojier",
    match = {
        initial_class = "^(org.kde.plasma.emojier)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.6)", "(monitor_h*0.7)"},
})

-- Fluxer
hl.window_rule({
    name = "browser-streaming",
    match = {
        initial_title = "^(.*)(is sharing)(.*)$",
    },
    workspace = "special:void silent",
})

-- FL Studio
hl.window_rule({
    name = "fl-studio",
    match = {
        initial_title = "^(FL Studio)(.*)$",
    },
    move = {6, 6},
    size = {2548, 1390},
    float = true,
})

-- KeepassXC
hl.window_rule({
    name = "keepassxc",
    match = {
        initial_class = "org.keepassxc.KeePassXC",
    },
    no_screen_share = true,
})

-- Koko
hl.window_rule({
    name = "koko-hyprshot",
    match = {
        initial_title = "^(.*)(hyprshot.png — Photos)$",
    },
    float = true,
    move = {"(monitor_w*0.245)", "(monitor_h*0.01)"},
    size = {"(monitor_w*0.75)", "(monitor_h*0.75)"},
})

hl.window_rule({
    name = "koko-share",
    match = {
        initial_title = "^(Photos)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.2)", "(monitor_h*0.4)"},
})

-- ProtonVPN
hl.window_rule({
    name = "protonvpn",
    match = {
        initial_class = "protonvpn-app",
    },
    no_screen_share = true,
    float = true,
    move = {2154, 688},
    size = {400, 714},
})

------------------------------
---- Grouped Window Rules ----
------------------------------

-- Art Programs
hl.window_rule({
    name = "art-apps-by-class",
    match = {
        initial_class = "^(Aseprite|gimp|krita)$",
    },
    opacity = "1 override",
})

hl.window_rule({
    name = "art-apps-by-title",
    match = {
		initial_title = "^(.*)Godot(.*)$",
	},
	opacity = "1 override",
})

-- Dialog windows
hl.window_rule({
    name = "large-dialogs",
    match = {
        title = "^(Open File|Volume Control|Select a File|Choose wallpaper|Open Folder|Save screenshot|Save As|Library|File Upload|Choose Application|Select file|Select folder)(.*)$|^(.*)(wants to save|wants to open)$|^(Select)(.*)(F)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "small-dialogs",
    match = {
        initial_class = "^(hyprland-share-picker)$",
    },
    center = true,
    float = true,
    size = {800, 500},
})

-- Picture-in-Picture
hl.window_rule({
    name = "picture-in-picture",
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    float = true,
    keep_aspect_ratio = true,
    move = {"(monitor_w*0.73)", "(monitor_h*0.72)"},
    size = {"(monitor_w*0.25)", "(monitor_h*0.25)"},
    pin = true,
})

-----------------------
---- SPECIAL RULES ----
-----------------------

-- On workspaces with fullscreen windows, AUTOMATICALLY create new windows fullscreen'd
hl.on("window.open", function(win)
    local ws = win.workspace
    if win.floating then return end -- Skip windows that open floating

    for _, w in ipairs(hl.get_windows()) do
        if w.workspace ~= nil
        and w.workspace.id == ws.id
        and w.address ~= win.address   -- skip the newly opened window itself
        and w.fullscreen > 0           -- 1 = fullscreen, 2 = maximised
        then
            hl.dispatch(hl.dsp.window.fullscreen({ action = "set", window = win }))
            break
        end
    end
end)

---------------------
---- LAYER RULES ----
---------------------

hl.layer_rule({
    name = "hyprpicker",
    match = {
        namespace = "hyprpicker",
    },
    no_anim = true,
})

hl.layer_rule({
    name = "selection",
    match = {
        namespace = "selection",
    },
    no_anim = true,
})

-- DMS
-- Ignore alpha suggestion is (opacity-1)%
hl.layer_rule({
    name = "dms-blur",
    match = {
        namespace = "dms:.*$",
    },
    ignore_alpha = 0.59,
    blur = true,
    blur_popups = true,
})

hl.layer_rule({
    name = "dms-color-picker",
    match = {
        namespace = "dms:color-picker",
    },
    no_anim = true,
})
