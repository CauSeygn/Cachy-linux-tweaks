# Preface
This is an opinionated install, but clean of garbage configs that you'd have to hunt down, you can either skip KDE and come here (in which case, you're on your own), or proceed after picking KDE during the installation.
# Files modified (for easy cleanup)
`~.config/hypr/*`\
`~.config/xdg-desktop-portal/`\
`~.config/noctalia/`\
`~.config/sherlock/`\
`~.face/`\
`~Pictures/Wallpapers/`

## Install Hyprland
First, update your system with:
```sh
paru
```
And restart if necessary.
### Open a terminal and type:
```sh
paru -S hyprland noctalia-shell cliphist wl-clipboard matugen-bin kitty qt5ct qt6ct-kde archlinux-xdg-menu sherlock-launcher-bin xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent hyprpicker hyprsysteminfo yazi hyprshot
```
This will install all the packages that I use (you can add your own later, or remove ones you don't want, but keep in mind `noctalia-shell`'s dependencies).

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
Place whichever component in here that you are going to use into `~.config/` and give the configs are read-through to familiarize yourself.
## Now you can reboot into Hyprland
(I trust you copied everything provided, otherwise you're on your own.)
### Now that you are in Hyprland
Open a terminal with `Alt + q` and type:
```sh
qt6ct
```
and customize the look and feel of QT (KDE) apps. To do the same with GTK apps, take a look at Hyprland wiki or something, idc about GTK (the provided config simply prefers dark theme on GTK4 and does best-effort on GTK2/3).
# From here on feel free to customize things yourself.