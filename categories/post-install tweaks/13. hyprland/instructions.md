# Preface
This is an opinionated install, but clean of garbage configs that you'd have to hunt down as I list every manually modified directory, you can either skip KDE and come here (in which case, you're on your own), or proceed after picking KDE during the installation. Note that I use a different launcher and clipboard manager (`sherlock` and `clipse`) to what Noctalia provides, but provide both, thus if you want to use the builtin ones then take a look at its wiki and omit these three packages.

# Directories modified manually (for easy cleanup)
`~/.config/hypr/*`\
`~/.config/systemd/user/*` (user systemd files for the wm and noctalia)\
`~/.config/xdg-desktop-portal/`\
`~/.config/flameshot/`\
`~/.config/gtk-3.0/*` (theming start)\
`~/.config/gtk-4.0/*`\
`~/.config/qt5ct/`\
`~/.config/qt6ct/` (theming end)\
`~/.config/kitty/`\
`~/.config/sherlock/`\
`~/.face/` (profile pics go here)\
`~/Pictures/Wallpapers/` (wallpapers go here)\
`~/.local/share/icons/default/index.theme` (XWayland cursor example)\
`~/.local/share/applications/yazi.desktop` (run yazi in kitty)\
`~/.local/share/color-schemes/EmeraldDarkCopy.colors` (theme)\
`~/.local/share/dbus-1/services/org.freedesktop.secrets.service` (KWallet shenanigans)\
`~/Mouse Accel Profile/` (python script for pointer accel)

## Install Hyprland
First, update your system with:
```sh
paru
```
And restart if necessary.
### Open a terminal and type:
```sh
paru -S hyprland quickshell-git noctalia-shell-git cava cliphist wl-clipboard matugen-bin kitty qt5ct-kde qt6ct-kde sherlock-launcher-bin xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent hyprpicker yazi grim slurp udiskie flameshot clipse clipse-gui
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
For me, this prints out the keycode `rs` and the variant that i want `latin`, so for me i would input `kb_layout = rs` & `kb_variant = latin` into `~/.config/hypr/config/input.conf` to apply it.
### Third
Place whichever component in here that you are going to use into `~/.config/` and give the configs a read-through to familiarize yourself, __ESPECIALLY__ `input.conf` and, if you use multiple monitors, `window_and_layer_rules.conf`. If your GPU is not nVidia, make sure to also remove the last two lines in `environment_variables.conf`.

If you don't want to theme things yourself, copy the theme related things at the top and in `qt5ct.conf` & `qt6ct.conf` change the paths to your username.
### Fourth
If you use chromium-based browsers or electron apps (such as VS Code) with `kwallet`:

1. Make it so the last app exiting doesn't close the wallet, in the wallet settings or if you have the kcm package for it, in kde settings.
2. In `~/.config/ChromiumBrowserNameHere-flags.conf`, `~/.config/code-flags.conf` and `~/.config/ElectronAppWhichUsesLibsecretsNameHere-flags.conf` or `~/.config/electronVersionOmissable-flags.conf` (electron34-flags.conf, electron-flags.conf; I don't recommend using it globally like this, for electron apps if they provide config files specific to them use those, otherwise put the following in their [launch arguments](../10.%20electron%20and%20chromium/instructions.md)):
```sh
--password-store=kwallet6
```
alternatively for VS Code, in `~/.vscode/argv.json` add:
```json
"password-store": "kwallet6"
```
wherever you like into the {} enclosure, surely you know json syntax?
#### (this config provides a `brave-flags.conf` in its correct path as an example, there's no need to copy this over if you don't use Brave)

3. Naturally for autologin, your KWallet password should be passwordless, or mess with `pam_autologin` from the aur, following the arch wiki pam page if you want passworded autologin unlocks.
### Fifth
As in the third step, run through the things located outside of `~/.config/` and place them where they are shown to be (creating paths that don't exist beforehand).
### Sixth
Open a terminal and type:
```sh
systemctl --user add-wants hyprland-session.target noctalia.service 
systemctl --user add-wants hyprland-session.target hyprpolkitagent.service
```

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