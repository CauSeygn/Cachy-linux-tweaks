# Search for specific packages:
You can use either [yay](../../post-install%20tweaks/0.%20yay/instructions.md) or pacman, the syntax is the same, I prefer yay.

```sh
yay -Qs searchquery
```

The `searchquery` doesn't need to be one word. This will perform a search on your installed list of packages.

# If you want more info on a specific package:

```sh
yay -Qi nameofpackage
```

# If you want even more info:

```sh
yay -Qii nameofpackage
```

# To search for packages foreign to pacman:
Such as AUR packages, you would do:

```sh
yay -Qm
```

# You can also see what a specific package has installed by running:

```sh
yay -Qlq nameofpackage | rg -v '/$' | rg --passthru '/'
```

This will list out all the directories and files that specific package has created, deduplicate entries (so no `/usr`, `/usr/bin`, `/usr/bin/nameofpackage` to just say that last one), and color the slashes so you can differentiate easily.

# To set an already installed package as explicitly installed:
(perhaps another package installed it as a dependency but you like or need that package), you would do:

```sh
yay -D --asexplicit nameofpackage
```

## The reverse operation is:

```sh
yay -D --asdeps nameofpackage
```

# To print out all the packages you have on your system you can do:

```sh
yay -Qq
```

## A more useful thing is to output that list to a file:

```sh
yay -Qq > nameoffile.log
```

This will create 'nameoffile.log' in your current working directory. For more info either read the pacman page on the Arch wiki or:

```sh
man pacman
```

```sh
man yay
```