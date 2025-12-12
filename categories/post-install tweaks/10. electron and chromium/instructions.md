# Note:
as of chromium 140 it now launches in native wayland, electron does as of 37; if your usage is nothing prior, skip this section

# Preface
These things when run in XWayland run poorly (on Wayland), to override that, launch the program as (in this case let's use freetube, an electron app):

```sh
freetube --ozone-platform-hint=wayland --ozone-platform=wayland
```

## In KDE's menu editor this entry would look like:

- Program: `/usr/bin/freetube`
- Command-line arguments: `--ozone-platform-hint=wayland --ozone-platform=wayland %U`

## Alternatively
you can make a file in `~/.config/` named `electron-flags.conf` and put:

```sh
--ozone-platform-hint=wayland
--ozone-platform=wayland
```
as the contents, or use `electron34-flags.conf` to target only that one, but I recommend doing it app by app instead.
#### (as mentioned up top this is slowly being phased out and made default but discord will probably still be on XWayland till 2050; as of chromium 140 & electron 37 these flags are unneeded, prior electron versions still need these)

## Other things also have their flags set similarly, consult the Arch wiki on chromium.