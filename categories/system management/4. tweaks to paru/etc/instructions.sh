# Normally, when you install things from the AUR, it will (sometimes) run
# a long and boring self-testing phase. To skip these, either edit this line
# in your /etc/makekpkg.conf:

BUILDENV=(!distcc color !ccache !sign)

# To look like this:

BUILDENV=(!distcc color !ccache !check !sign)

# Or, open the terminal and do:

sudo cp makepkg.conf /etc/

# If you find the program seems to be failing, perhaps it's failing
# these tests, in which case you can reinstall the program,
# but this time as such:

paru -S --check nameofaurprogram

# This will override the setting in that file (though you still likely
# won't be able to do anything, you'll just know it's faulty - very useful
# (this is sarcasm)).