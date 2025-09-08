# To search for specific packages you can use either paru or pacman,
# the syntax is the same, I prefer paru as it's preinstalled and has some QOL.

paru -Ss searchquery

# The 'searchquery' doesn't need to be one word. This is a safe way to
# search for anything. If you want more info on a specific package:

paru -Si nameofpackage

# If you want more info:

paru -Sii nameofpackage

# To install packages, you have one method with pacman, two with paru,
# the first is:

paru -S nameofpackage

# The name must be correct in this case. The second is:

paru vaguename

# In this case the name does not need to be correct, but make sure
# what you're installing is actually the thing you want. This'll drop
# you into a package selector.

# If you are installing a package from the AUR make sure to read through
# the pkgbuild, to make sure what you're installing is actually what it
# says it is and not a virus. Once you're done reading, (first press q
# if you had to scroll and) press enter.

# For more info either read the pacman page on the Arch wiki or:

man pacman