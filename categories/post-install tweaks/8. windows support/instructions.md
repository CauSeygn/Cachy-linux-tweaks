# Preface
To use (most) Windows applications/play games, you just need to install the gaming meta-package (easiest way):\
In application menu open: `Cachy Hello -> Apps/Tweaks -> Install Gaming packages`.

This will install everything from wine to steam to lutris to heroic... you get the point.

# Wine specific things I use:

# Winetricks
Open Menu Editor from the Application Menu and navigate to the Winetricks entry. In the Command-line arguments field, add:

```sh
--gui=zenity
```

And save and exit. Now you can use winetricks in a gui that has visual feedback and will prevent it defaulting to the other, awful one.

Before getting into specifics, generate your wine prefix by running:

```sh
winecfg
```

In the terminal from anywhere. Then from the app menu run `winetricks -> default prefix`.

Here, you want to go to install a windows dll or component and tick:

- .net (and desktop) versions if you need any to run any programs/games (7,8,9 or later in the future)
- vcrun2022 (or latest)

#### NOTE on .net: If you at any point install .NET system-wide (but also use it in wine) you will NEED to start whatever you're trying to run in wine/proton as:

```sh
DOTNET_BUNDLE_EXTRACT_BASE_DIR=dotnetfiles 'DOTNET_ROOT=C:\Program Files\dotnet' wine programOrGame.exe
```

#### Otherwise your game/program will attempt to use your system's .net and fail. Example of such an application in the previously discussed Menu Editor:

- Environment variables: `DOTNET_BUNDLE_EXTRACT_BASE_DIR=dotnetfiles 'DOTNET_ROOT=C:\Program Files\dotnet'`
- Program: `wine`
- Command-line arguments: `start /unix %f /home/banana308/Games/game.exe`

#### (obviously your username and the actual name and path of the game or program executable)

### Then you would save this entry and you can directly launch your game from the app menu and/or pin it to the taskbar.

## For japanese locale games, see [4. additional locales](../4.%20additional%20locales/instructions.md) and also here is a menu editor example:

- Environment variables: `LANG=ja_JP.UTF-8 TZ=Asia/Tokyo`
- Program: `wine`
- Command-line arguments: `start /unix %f /home/banana308/Games/game.exe`

## Anyway, aside from the derailment, the next bit, are fonts.
Aside from a few corrupt ones (I don't recall which, sorry, just use the list) you can install Windows fonts so in some edge cases fonts won't be blank.

### The list (tick everything BUT these):

- all fonts
- cjkfonts
- all the "fake..." ones
- micross
- opensymbol
- pptfonts
- uff

#### You can also install these to your system so you can use them outside of wine. Wherever your wine prefix is at (default is ~/.wine) navigate to `.../drive_c/windows/Fonts/` and copy everything from here to `~/.fonts/` but before that, open the terminal and do:

```sh
paru -S ttf-ms-fonts
```

Now your system has all those fonts as well (hunt down duplicates in `kde settings -> text & fonts -> font management -> find duplicates`).

# Proton
You may notice some games or programs won't run, or run poorly in just wine, but run in proton. Throw those into Lutris/Heroic Launcher/umu-launcher/Steam/whatever you like.\
Likewise in Steam, you can use Protontricks.\
Check [ProtonDB](https://www.protondb.com), [Are We Anti-Cheat Yet?](https://areweanticheatyet.com), [WineHQ](https://winehq.com) for compatibility, or just test it yourself.

# Making an application launch in its group
Whether you make your game's .desktop entry in KDE's Menu Editor or auto-generating it in Lutris, you will note that running it won't group windows if you run multiple instances of it.

To fix this, navigate to `~/.local/share/applications/` and find your `game or program.desktop`. Open it in your favorite editor and add the following anywhere under `[Desktop Entry]`:

```sh
StartupWMClass=name of the exe file.exe
```
(The example above uses spaces deliberately to showcase that you do not need any special syntax for exe files with spaces.)

For example, for AIMP:

```sh
StartupWMClass=AIMP.exe
```
now your program/game will be grouped, and fix other minor issues (such as a missing icon in window managers when using [Noctalia](../13.%20hyprland/)).

#### Note that this is not exclusive to Windows' games/programs, you may also do this for Linux native apps if they miss this, simply input the name of the binary.