# If you've heard that `Linux doesn't need to restart after updates`
then forget that, yes it does. When programs update, their services need to be restarted manually otherwise they won't use the new version (restart does this automatically naturally), and when the kernel itself updates a full restart is needed to unload the old one.

# Anyway, to safely update your system, run:

```sh
paru
```

`paru` by itself is the same running `sudo pacman -Syu`. Alternatively run cachy-update from the systray (either by left clicking it or `right click -> run cachy-update`). This will update every package on your system and the AUR (additionally cachy-update updates anything else you might have, such as flatpaks).

## If you want to cancel an update
It is safe to do so __ONLY__ if it hasn't already started (example: it's downloading things), or if you just finished updating system packages and are proceeding to the AUR portion. Never cancel an ongoing update otherwise you might restart to a broken system.

## Likewise if you cancel out of an upgrade
DO NOT install (using paru -S) anything because your database is now out of sync, this is the same as doing `paru -Sy package` which you should never do. `paru -Syu package` is safe, but generally avoid this.

### After an upgrade if you see the kernel being rebuilt, it's time to restart, especially if on nVidia side of things you see the driver getting upgraded (usually it will notify you either way but sometimes not).