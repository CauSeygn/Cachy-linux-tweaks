# To search for specific packages
You can use either paru or pacman, the syntax is the same, I prefer paru.

```sh
paru -Qs searchquery
```

The `searchquery` doesn't need to be one word. This will perform a search on your installed list of packages.

# If you want more info on a specific package:

```sh
paru -Qi nameofpackage
```

# If you want even more info:

```sh
paru -Qii nameofpackage
```

# To search for packages foreign to pacman

Such as AUR packages, you would do:

```sh
paru -Qm
```

# You can also see what a specific package has installed by running:

```sh
paru -Qlq nameofpackage | grep -v '/$'
```

This will list out all the directories and files that specific package has created.

# To set an already installed package as explicitly installed
(perhaps another package installed it as a dependency but you like or need that package), you would do:

```sh
paru -D --asexplicit nameofpackage
```

## The reverse operation is:

```sh
paru -D --asdeps nameofpackage
```

# To print out all the packages you have on your system you can do:

```sh
paru -Qq
```

## A more useful thing is to output that list to a file:

```sh
paru -Qq > nameoffile.log
```

This will create 'nameoffile.log' in your home directory. For more info either read the pacman page on the Arch wiki or:

```sh
man pacman
```

```sh
man paru
```