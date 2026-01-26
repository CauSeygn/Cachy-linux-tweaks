# Preface
Some things are unfortunately misconfigured or absent in Cachy (though rare) or things simply migrate to new things for new users, but leave existing users to manage this by themselves.
Such are the wrong phonon backend on older installs, or the lack of codecs. This shouldn't be the case on newer installs, but in case it is, open the terminal and run:

```sh
paru -S vlc-plugins-all phonon-qt6-vlc
```

Then run:

```sh
phononsettings
```

And configure it to use the vlc backend, on some apps (such as kalarm) you need to do this in its settings, so keep an eye out for that.

## Other (that I consider) missing stuff:

```sh
paru -S kdenetwork-filesharing fuse2 kio-admin khelpcenter sshfs kcmutils5 icoutils
```

### Explanations:
- dolphin share gui
- appimage support
- dolphin admin actions
- aggregated manual pages
- kde connect filesystem browser
- shows you some missing things in kde settings (such as s.m.a.r.t. monitor)
- lets you manipulate icons off binary files (helpful for extracting icons out of .exe files)

## SSH
If you want to use ssh to connect, the service needs to be enabled, you would thus run:

```sh
systemctl enable --now sshd
```

#### Without the `--now` flag you either need to restart or run that but with the `start` argument. Make sure to modify ufw accordingly (I prefer disabling the firewall entirely as it's cumbersome and I'm not running a server).

## Replace SDDM with PLM
As of january 2026, SDDM was replaced with Plasma Login Manager, new installs picking KDE won't ever see SDDM on it but existing users won't get automatically migrated. To migrate, first update your system:
```sh
paru
```
then check whether your mirror is holding at least version 6.5.90 (anything less is buggy, rank your mirrors):
```sh
pacman -Ss plasma-login-manager
```
then run:
```sh
sudo pacman -S plasma-login-manager && sudo systemctl disable sddm && sudo systemctl enable plasmalogin && sudo pacman -R sddm-kcm cachyos-themes-sddm sddm layer-shell-qt5
```
Finally, configure it in KDE System Settings -> Login Screen (under Security & Privacy). You can now reboot/shutdown/whatever, next boot you'll see PLM (or not, if you autologin). Note that PLM is usable under DE/WM's other than KDE, I use it in Hyprland.