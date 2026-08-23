# Preface
Normally, when you install things from the AUR, or build them yourself, it will (sometimes) run a long and boring self-testing phase. To skip these, either edit this line in your `/etc/makekpkg.conf`:

```sh
BUILDENV=(!distcc color !ccache !sign)
```

To look like this:

```sh
BUILDENV=(!distcc color !ccache !check !sign)
```

## Or, open the terminal here <strong><u>[BUT NOTE THAT THIS IS FOR MY CPU ARCHITECTURE (x86_64_v3)!]</u></strong> and do:

```sh
sudo cp makepkg.conf /etc/
```

If you find the program seems to be failing, perhaps it's failing these tests, in which case you can reinstall the program, but this time as such:

```sh
yay -S --check --rebuild nameofaurprogram
```

This will override the setting in that file (though you still likely won't be able to do anything, you'll just know it's faulty - very useful if you're not a dev (this is sarcasm)).