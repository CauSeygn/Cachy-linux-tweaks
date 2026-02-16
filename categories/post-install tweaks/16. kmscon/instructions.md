# Preface
kmscon is a userspace kms/drm accelerated replacement for the kernel tty with mouse and scrolling support

## Replace
1. First, update your system if you haven't in a long time, then open the terminal and type:
```sh
yay -S kmscon
```
next:
```sh
sudo cp /etc/kmscon/kmscon.conf.example /etc/kmscon/kmscon.conf
```
or, copy the provided kmscon.conf example from this section to `/etc/kmscon/`.

Then open it with your favorite text editor and edit the fields you wish, to your liking by consulting the archwiki kmscon page and the config file itself which is nicely documented (note that mine includes autologin at the very bottom, however that does not work for whatever reason, unfortunately).

2. Now, open the terminal and type:
```sh
systemctl disable getty@tty1.service && systemctl enable kmsconvt@tty1.service
```
followed by:
```sh
micro /etc/systemd/system/display-manager.service
```
or your favorite text editor, and change `Conflicts=` and `After=` references from `getty@tty1.service` to `kmsconvt@tty1.service` and save (do not modify anything else).

Finally:
```sh
sudo ln -s '/usr/lib/systemd/system/kmsconvt@.service' '/etc/systemd/system/autovt@.service'
```
3. Before you reboot <strong>MAKE SURE IT WORKS (it should, but make sure anyway) OTHERWISE YOU'LL NEED A LIVE USB TO RECOVER!</strong>; try `Ctrl+Alt+F3 to F6`; if you don't get any prompt, return to the GUI via `Ctrl+Alt+F1` and run everything here in reverse (deleting `/etc/systemd/system/autovt@.service` symlink) to revert.
4. If everything works fine, you can now enjoy a tty with mouse support and scrollback, in the rare instances where you're forced to use it.