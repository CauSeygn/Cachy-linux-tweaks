# Preface
If you get a bad update (system won't boot into the OS, shit's broken,...), you can simply restore a previously working snapshot.

## Reverting
Boot into a snapshot of your choice, and you'll be greeted with a limine notification, telling you you're in one, simply restore from the notification, or open `limine-snapper-restore` from the app menu and restore from there. After restoring is complete, reboot and make sure you are not booting back into the snapshot by explicitly selecting the regular kernel option in limine (spam arrow keys so you don't miss it, if your monitor's a bit dumb on reboots like mine is).

### __DO NOT USE `BTRFS-ASSISTANT`, IT CANNOT RESTORE DIFFERENT KERNELS, YOU'LL BE LEFT IN A BROKEN STATE.__