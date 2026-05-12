------------------
---- KEYWORDS ----
------------------

-- Set keyword aliases to things that you use:
local prefix = "exec-app "
local terminal = prefix .. "kitty"
local fileManager = prefix .. "dolphin"
local menu = "dms ipc call spotlight toggle"
local clipboard = prefix .. "kitty --class clipse -e clipse"
local emoji = prefix .. "plasma-emojier"
local pickColor = prefix .. "hyprpicker --autocopy"
local screenshotUtil = "hyprctl eval 'hl.config({ cursor = { use_cpu_buffer = true } })' && hyprshot -m region -s -z --clipboard-only && hyprctl eval 'hl.config({ cursor = { use_cpu_buffer = false } })'"
local screenshotUtilEdit = "hyprctl eval 'hl.config({ cursor = { use_cpu_buffer = true } })' && hyprshot -m region -s -z -o '/tmp' -- gwenview && hyprctl eval 'hl.config({ cursor = { use_cpu_buffer = false } })'"
local keybindMenu = "dms ipc call keybinds toggle hyprland"

---------------------
---- KEYBINDINGS ----
---------------------

-- Mod list: SHIFT CAPS CTRL/CONTROL ALT MOD2 MOD3 SUPER/WIN-LOGO/MOD4 MOD5.
-- MOD5 is AltGr.
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Built into DMS:
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd(keybindMenu)) -- Show cheatsheet window

-- 1. Main Section:
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal)) -- Terminal
hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- Kill Active Window
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- File Manager
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- Toggle Floating
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" })) -- Toggle Fullscreen
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + period", hl.dsp.layout("colresize +conf")) -- Bigger Column
hl.bind(mainMod .. " + comma", hl.dsp.layout("colresize -conf")) -- Smaller Column
hl.bind(mainMod .. " + X", hl.dsp.layout("move +col")) -- Next Column
hl.bind(mainMod .. " + Y", hl.dsp.layout("move -col")) -- Previous Column
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin()) -- Toggle Pin
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(pickColor)) -- Color Picker
hl.bind("Print", hl.dsp.exec_cmd(screenshotUtil)) -- Take a Screenshot
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(screenshotUtilEdit)) -- Take and edit a Screenshot
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard)) -- Clipboard Manager

-- 2. Window Management:
hl.bind(mainMod .. " + W", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + A", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + S", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + D", hl.dsp.layout("consume_or_expel next"))

-- 3. Workspace Management:
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i})) -- Switch to Workspace #
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- Move active window to Workspace #
end

-- 4. Special Workspace:
hl.bind(mainMod .. " + G", hl.dsp.workspace.toggle_special("magic")) -- Toggle it
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "special:magic" })) -- Move active window to it

-- 5. Workspace and Window Navigation:
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" })) -- Next Workspace
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" })) -- Previous Workspace
hl.bind("ALT + TAB", hl.dsp.window.cycle_next()) -- Focus next app on the Workspace

-- 6. Window Manipulation:
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- Move
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize

-- 7. Global Shortcuts:
hl.bind(mainMod .. " + F10", hl.dsp.pass({ window = "class:^(com.obsproject.Studio)$" })) -- Start/Stop recording OBS

-- 8. Laptops:
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true }) -- Increase Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true }) -- Decrease Volume
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true }) -- Mute Speakers
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true }) -- Mute Microphone
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true }) -- Increase Brightness
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true }) -- Decrease Brightness

-- 9. Media control through playerctl:
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true }) -- Next
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Pause
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Play
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- Previous
