# Note:
as of chromium 140 it now launches in native wayland, electron does as of 37; if your usage is nothing prior, and you're not an nVidia user, skip this section; if you are an nVidia user and use nothing prior, give this a read-through to familiarize yourself with how custom flags work but follow nothing until `HW Dec`; users of other GPU vendors should not follow `HW Dec`

# Preface
These things when run in XWayland run poorly (on Wayland), to override that, launch the program as (in this case let's use freetube, an electron app):

```sh
freetube --ozone-platform-hint=wayland --ozone-platform=wayland
```

## In KDE's menu editor this entry would look like:

- Program: `freetube`
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

# HW Dec (nVidia)
Enabling hardware decoding is as of January 2026 already automatically handled in chromium if `libva-nvidia-driver` is present, but this isn't the case as of electron 39 (it might be in electron 40, remains to be seen). All you should do for browsers is set `CUDA_DISABLE_PERF_BOOST=1` in their `.desktop` file (see below).

For electron, to enable it, the electron app first must be launched in wayland backend, then additional flags must be passed. For the sake of convenience, I will show both electron 34 (XWayland default) and electron 39 (Wayland default) examples:

```sh
CUDA_DISABLE_PERF_BOOST=1 freetube --ozone-platform-hint=wayland --ozone-platform=wayland --enable-features=AcceleratedVideoDecodeLinuxGL,VaapiOnNvidiaGPUs,AcceleratedVideoDecodeLinuxZeroCopyGL
```

```sh
CUDA_DISABLE_PERF_BOOST=1 vesktop --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiIgnoreDriverChecks
```
the listed environment allows the GPU to go to lower powerstates instead of getting pinned to at least P2, resulting in actual efficient hardware decoding. With hardware decoding enabled, HEVC videos in electron (discord) will play.

## In KDE's menu editor vesktop's entry would look like:

- Environment Variables: `CUDA_DISABLE_PERF_BOOST=1`
- Program: `vesktop`
- Command-line arguments: `--enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiIgnoreDriverChecks %U`