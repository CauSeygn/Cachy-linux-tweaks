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
    name = "aimp-main-app",
    match = {
    initial_class = "aimp.exe",
    initial_title = "^$",
    },
    no_initial_focus = true,
})

hl.window_rule({
    name = "aimp-menus",
    match = {
        initial_class = "aimp.exe",
        initial_title = "^$",
        focus = false,
    },
    opacity = "0 override",
    no_anim = true,
    no_blur = true,
    border_size = 0,
})

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

-- Fluxer
hl.window_rule({
    name = "fluxer-browser-streaming",
    match = {
        initial_title = "web.fluxer.app is sharing a window.",
    },
    workspace = "special:void silent",
})

-- Flash
hl.window_rule({
    name = "adobe-flash",
    match = {
        initial_title = "Adobe Flash Player.*",
    },
    float = true,
    size = {828, 828},
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

-- Gwenview Send to Device
hl.window_rule({
    name = "gwenview-share",
    match = {
        initial_title = "Send File — Gwenview",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.25)", "(monitor_h*0.4)"},
})

-- HCI
hl.window_rule({
    name = "hammercrest-idle",
    match = {
        initial_title = "Hammer Crest Idle",
    },
    render_unfocused = true,
    float = true,
})

-- Hyprshot Annotating in Gwenview
hl.window_rule({
    name = "hyprshot-gwenview",
    match = {
        initial_title = "^(Gwenview)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.65)", "(monitor_h*0.75)"},
})

-- KeepassXC
hl.window_rule({
    name = "keepassxc",
    match = {
        initial_class = "org.keepassxc.KeePassXC",
    },
    no_screen_share = true,
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
    name = "aseprite",
    match = {
        initial_class = "Aseprite",
    },
    opacity = "1 override",
})

hl.window_rule({
    name = "gimp",
    match = {
        initial_class = "gimp",
    },
    opacity = "1 override",
})

hl.window_rule({
    name = "krita",
    match = {
        initial_class = "krita",
    },
    opacity = "1 override",
})

-- Dialog windows
hl.window_rule({
    name = "dialog-windows-1",
    match = {
        title = "^(Open File)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-2",
    match = {
        title = "^(Volume Control)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-3",
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
    match = {
        title = "^(Select a File)(.*)$",
    },
})

hl.window_rule({
    name = "dialog-windows-4",
    match = {
        title = "^(Choose wallpaper)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-5",
    match = {
        title = "^(Open Folder)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-6",
    match = {
        title = "^(Save screenshot)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-7",
    match = {
        title = "^(Save As)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-8",
    match = {
        title = "^(Library)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-9",
    match = {
        title = "^(File Upload)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-10",
    match = {
        title = "^(.*)(wants to save)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-11",
    match = {
        title = "^(.*)(wants to open)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-12",
    match = {
        title = "^(Choose Application)(.*)$",
    },
    center = true,
    float = true,
    size = {782, 677},
})

hl.window_rule({
    name = "dialog-windows-13",
    match = {
        title = "^(Select file)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-14",
    match = {
        title = "^(Select folder)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-15",
    match = {
        title = "^(Select)(.*)(F)(.*)$",
    },
    center = true,
    float = true,
    size = {"(monitor_w*0.7)", "(monitor_h*0.9)"},
})

hl.window_rule({
    name = "dialog-windows-16",
    match = {
        initial_class = "hyprland-share-picker",
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