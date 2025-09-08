# To use (most) Windows applications/play games, you just need to install
# the gaming meta-package (easiest way),
# in application menu open:
# Cachy Hello -> Apps/Tweaks -> Install Gaming packages.

# This install everything from wine to steam to lutris to heroic...
# you get the point.

# Wine specific things I use:

#----------------------- Winetricks: -------------------------------------
# Open Menu Editor from the Application Menu and navigate to the Winetricks
# entry. In the Command-line arguments field, add:

--gui=zenity

# And save and exit. Now you can use winetricks in a gui that has visual
# feedback and will prevent it defaulting to the other, awful one.

# Before getting into specifics, generate your wine prefix by running:

winecfg

# In the terminal from anywhere.
# Then from the app menu run winetricks -> default prefix.

# Here, you want to go to install a windows dll or component and tick:

# - .net (and desktop) versions if you need any to run any programs/games
# (7,8,9 or later in the future)
# - vcrun2022 (or latest)

# NOTE on .net:
# If you at any point install .NET system-wide (but also use it in wine)
# you will NEED to start whatever you're trying to run as:

DOTNET_BUNDLE_EXTRACT_BASE_DIR=dotnetfiles 'DOTNET_ROOT=C:\Program Files\dotnet' wine programOrGame.exe

# Otherwise your game/program will attempt to use your system's .net and fail.

# Example of such an application in the previously discussed Menu Editor:

# Environment variables: DOTNET_BUNDLE_EXTRACT_BASE_DIR=dotnetfiles 'DOTNET_ROOT=C:\Program Files\dotnet'
# Program: wine
# Command-line arguments: start /unix %f /home/banana308/Games/game.exe
# (obviously your username and the actual name of the game or program executable)

# Then you would save this entry and you can directly launch your
# game from the app menu and/or pin it to the taskbar.

# For japanese locale games, see 4. and also a menu editor example:

# Environment variables: LANG=ja_JP.UTF-8 TZ=Asia/Tokyo
# Program: wine
# Command-line arguments: start /unix %f /home/banana308/Games/game.exe

# Anyway, aside from the derailment, the next bit, are fonts.
# Aside from a few corrupt ones (I don't recall which, sorry, just use the list)
# you can install Windows fonts so in some edge cases fonts won't be blank.

# The list (tick everything BUT these):

# all fonts
# cjkfonts
# all the "fake..." ones
# micross
# opensymbol
# pptfonts
# uff

# You can also install these to your system so you can use them outside of
# wine. Wherever your wine prefix is at (default is ~/.wine) navigate to
# .../drive_c/windows/Fonts/ and copy everything from here to ~/.fonts/
# but before that, open the terminal and do:

paru -S ttf-ms-fonts

# Now your system has all those fonts as well
# (hunt down duplicates in kde settings -> text & fonts -> font management -> find duplicates).
# ------------------- End of Winetricks ------------------------------------------

# You may notice some games or programs won't run, or run poorly in just wine,
# but run in proton. Throw those into
# Lutris/Heroic Launcher/umu-launcher/Steam/whatever you like.
# Likewise in Steam, you can use Protontricks and check
# www.protondb.com, areweanticheatyet.com, winehq.com
# for compatibility, or just test it yourself.