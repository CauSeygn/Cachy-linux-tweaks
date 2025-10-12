# Preface
This is an opinionated install, but clean of garbage configs that you'd have to hunt down, you can either skip KDE and come here (in which case, you're on your own), or proceed after picking KDE during the installation. Note that I use a different launcher to what Noctalia provides, if you want it however, take a look at its wiki.

# Directories modified manually (for easy cleanup)
`~/.config/hypr/*`\
`~/.config/xdg-desktop-portal/`\
`~/.config/flameshot/`\
`~/.face/` (profile pics go here)\
`~/Pictures/Wallpapers/` (wallpapers go here)\
`~/.local/share/icons/default/index.theme` (XWayland cursor)
`~/Mouse Accel Profile/` (python script for pointer accel)

## Install Hyprland
First, update your system with:
```sh
paru
```
And restart if necessary.
### Open a terminal and type:
```sh
paru -S hyprland quickshell-git noctalia-shell-git cliphist wl-clipboard matugen-bin kitty qt5ct-kde qt6ct-kde sherlock-launcher-bin xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent hyprpicker yazi grim slurp udiskie flameshot clipse clipse-gui
```
This will install all the packages that I use (you can add your own later, or remove ones you don't want, but keep in mind `noctalia-shell`'s dependencies).
Note that you may also want `nwg-look` to customize GTK apps, alternatively re-log back into KDE and change GTK looks there.

## Once that is done
There are a few things to do before going into Hyprland.
### First
Set your default session in KDE System Settings to Hyprland (if you use autologin).
### Second
Find your keyboard layout if it's different from English (US):
```sh
grep -i 'yourlanguage' /usr/share/X11/xkb/rules/base.lst
```
For me, this prints out the keycode `rs` and the variant that i want `latin`, so for me i would input `kb_layout = rs` & `kb_variant = latin` into `~.config/hypr/config/input.conf` to apply it.
### Third
Place whichever component in here that you are going to use into `~.config/` and give the configs a read-through to familiarize yourself, __ESPECIALLY__ `input.conf` and, if you use multiple monitors, `window_and_layer_rules.conf`. If your GPU is not nVidia, make sure to also remove the last two lines in `environment_variables.conf`.
### Fourth
If you use chromium-based browsers with `kwallet`, consider either not using kwallet or making your browser launch with the (__FIRST EXPORT PASSWORDS!__):
```sh
--password-store=basic
```
flag. (you will need to re-log into sites, and import passwords, but only once, instead of whenever kwallet feels like shit)

## Now you can reboot into Hyprland
(I trust you copied everything provided, otherwise you're on your own.)
### Now that you are in Hyprland
Open a terminal with `Win|Super + q` and type:
```sh
qt6ct
```
and customize the look and feel of QT6 (KDE) apps. Once you're done, repeat, but this time:
```sh
qt5ct
```
and customize the look and feel of QT5 (KDE) apps. To do the same with GTK apps:
```sh
nwg-look
```
and customize the look and feel of GTK apps. Alternatively re-log back into KDE and change GTK looks there.

If you want to change the cursor theme, you have to do so in both the hyprland `input.conf` config, as well as in `~/.local/share/icons/default/index.theme` (for XWayland apps).

# From here on feel free to customize things yourself.
### https://wiki.hypr.land/
### https://docs.noctalia.dev/docs/