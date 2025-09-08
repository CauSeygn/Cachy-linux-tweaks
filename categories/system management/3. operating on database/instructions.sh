# To search for specific packages you can use either paru or pacman,
# the syntax is the same, I prefer paru.

paru -Qs searchquery

# The 'searchquery' doesn't need to be one word. This will perform
# a search on your installed list of packages.
# If you want more info on a specific package:

paru -Qi nameofpackage

# If you want more info:

paru -Qii nameofpackage

# To search for packages unmanaged by pacman, such as AUR packages,
# you would do:

paru -Qm

# You can also see what a specific package has installed by running:

paru -Qlq nameofpackage | grep -v '/$'

# This will list out all the directories and files that specific
# package has created.

# To set an already installed package as explicitly installed
# (perhaps another package installed it as a dependency but you like
# or need that package), you would do:

paru -D --asexplicit nameofpackage

# The reverse operation is:

paru -D --asdeps nameofpackage

# To print out all the packages you have on your system you can do:

paru -Qq

# A more useful thing is to output that list to a file:

paru -Qq > nameoffile.log

# This will create 'nameoffile.log' in your home directory. For more info
# either read the pacman page on the Arch wiki or:

man pacman