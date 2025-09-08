# These things often run in XWayland and thus poorly (on wayland),
# to override that, launch the program as
# (in this case let's use freetube, an electron app):

freetube --ozone-platform-hint=wayland --ozone-platform=wayland

# In KDE's menu editor this entry would look like:

# Program: /usr/bin/freetube
# Command-line arguments: --ozone-platform-hint=wayland --ozone-platform=wayland %U

# Alternatively, you can make a file in ~/.config/ named electron.flags and put:

--ozone-platform-hint=wayland
--ozone-platform=wayland

# as the contents. 
# (this is slowly being phased out and made default but discord will
# probably still be on XWayland till 2050)

# Other things also have their flags set similarly, consult the Arch wiki
# on chromium.