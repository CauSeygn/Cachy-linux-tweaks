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

### Jack:
Open the terminal and run:
```sh
paru -Qs jack
```
if you get out of `pipewire-jack` - great, move on from here - if you do not get output of `pipewire-jack`, run:
```sh
paru -S pipewire-jack
```
When prompted, replace `jack2` or whatever by typing `y` then pressing enter; pipewire-jack supersedes it.

## Other (that I consider) missing stuff:
```sh
paru -S kdenetwork-filesharing fuse2 kio-admin khelpcenter sshfs icoutils
```

### Explanations:
- dolphin share gui
- appimage support
- dolphin admin actions
- aggregated manual pages
- kde connect filesystem browser
- lets you manipulate icons off binary files (helpful for extracting icons out of .exe files)

## SSH
If you want to use ssh to connect, the service needs to be enabled, you would thus run:

```sh
systemctl enable --now sshd
```

#### Without the `--now` flag you either need to restart or run that but with the `start` argument. Make sure to modify ufw accordingly.

## ufw
If you don't want to deal with the firewall whatsoever, open the terminal and run:
```sh
sudo ufw disable
```
If you do, instead diagnose the output of:
```sh
ss -tulpn
```
to see which ports you should let through on your machine, for example here I have my set of rules:
```sh
sudo ufw allow from 192.168.9.0/24 to any port 22 proto tcp comment 'SSH'
sudo ufw allow from 192.168.9.200 comment 'My PC'
sudo ufw allow from 192.168.9.190 comment 'Phone'
sudo ufw allow from 192.168.9.0/24 to any port 1714:1764 proto tcp comment 'KDE Connect'
sudo ufw allow from 192.168.9.0/24 to any port 1714:1764 proto udp comment 'KDE Connect'
sudo ufw allow in on virbr0 comment 'VM'
sudo ufw allow out on virbr0 comment 'VM'
sudo ufw route allow in on virbr0 comment 'VM'
sudo ufw route allow out on virbr0 comment 'VM'
```
if your firewall was previously disabled, enable it:
```sh
sudo ufw enable
```
and check the status:
```sh
sudo ufw status verbose
# Or
sudo ufw status numbered
```
whichever you prefer. To remove a rule, query with `numbered` then for example running:
```sh
sudo ufw delete 9
```
would remove the 9th rule in `numbered` output. To edit a rule's, add it exactly how you added it and just change it.

My phone (`192.168.9.190`) and my pc (`192.168.9.200`) have static assigned ip addresses, so I trust those devices implicitly, `virbr0` — the virtual bridge device for my virtual machines is also implicitly trusted, the remaining three rules under the subnet mask of my local network (`192.168.9.0/24`) implicitly trust ssh and kde connect connections from other devices on my network (note that because I implicitly trust my phone, I could do away with needing a separate kde connect rule if that was the only device I intended to ever use kde connect on to connect to my pc). To easily scan for devices on my LAN, I would do:
```sh
nmap 192.168.9.0-255
```
Lastly, I let my router ping my device for mDNS discovery, which requires editing `/etc/ufw/before.rules` and adding:
```sh
# allow MULTICAST IGMP
-A ufw-before-input -i enp42s0 -p igmp -j ACCEPT
```
before `COMMIT`, where `enp42s0` is my ethernet connection, identifiable via querying `ip address` (aliased as `ip a` or `ip addr` by default).

Should you need to let anything else through, consult with:
```sh
journalctl -b 0 --grep "UFW"
```
and let through ip addresses that look familiar.

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

## Snapshot Management
As with Limine we get bootable snapshots by default in CachyOS, let's fix up the atrocious defaults a bit.

First, launch `Btrfs Assistant` and navigate to `Snapper Settings`. In there select (if you made additional ones) the `root` configuration and tick/tweak the following:
- tick `Enable timeline snapshots`, then tweak how many you like; use sane values here, so that you don't run out of `/boot` space later; I use 4 hourly/1 daily, 0 every other time-based
- tweak the `Number` amount, the default of 50 is simply insane, I use 4
- tick `Snapper timeline enabled` and `Snapper cleanup enabled`, then click `Apply systemd changes` then click `Save`, you can now exit the program

Second, use your favorite text editor and open `/etc/limine-snapper-sync.conf`, and find the following bits:
```sh
MAX_SNAPSHOT_ENTRIES
EXCLUDE_SNAPSHOT_TYPES
```
change these to **(note that the `5` in my case should in your case encompass the amounts you set above for the `timeline` section as discussed just above; so say that you've set `4/3/1/0`, you'd want to store `8`; again, your `/boot` partition size is the limit here, with 4/1/0/0 and 2 kernels, my `/boot` fluctuates between `~800mib-1.3gib/2gib`)**:
```sh
MAX_SNAPSHOT_ENTRIES=5
EXCLUDE_SNAPSHOT_TYPES="pre, post"
```
and save the file. What this will do is exclude those (often, __especially__ with AUR) useless bootable snapshots that pacman creates AND limit the qualified ones' amount to encompass just what we want [- 1 (in case of rapid updating)], once and clear away the trash.

To see it in action, type into the terminal `sudo limine-snapper-list` and the same ones you see there, are the same ones you'll see in Limine, during boot time.