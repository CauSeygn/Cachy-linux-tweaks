# Note:
Pacman is different to other package managers such as apt, performing checks to the database directly is unsafe if you don't plan on also updating your system. This equates to running either paru or pacman with the `-Sy` flags.\
This by itself isn't dangerous if you update later without installing anything else in the meantime, but if you forget, you're running the risk of leaving your system in a destabilized state.

## To safely check for updates you have two things, the first is:

```sh
checkupdates
```

## The second is the cachy-updates system tray
(right click -> Check for updates) or view what is already there as it runs periodically by itself.

### The first one scans only pacman, the second one scans everything.