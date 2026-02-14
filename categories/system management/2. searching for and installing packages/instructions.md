# Search for specific packages:
You can use either paru, [yay][def] or pacman, the syntax is the same, I prefer ~~paru as it's preinstalled and~~ yay, as it has some QOL. The following showcases paru, yay is the exact same syntax.

```sh
paru -Ss searchquery
```

The `searchquery` doesn't need to be one word.

# If you want more info on a specific package:

```sh
paru -Si nameofpackage
```

# If you want even more info:

```sh
paru -Sii nameofpackage
```

# To install packages:

You have two methods with pacman, three with paru, the first is:

```sh
paru -S nameofpackage
```

The name must be correct in this case.\
(Note: you can also specify a repo - example: `aur/nameofpackage`)

The second (paru-specific) is:

```sh
paru vaguename
```

In this case the name does not need to be correct, but make sure what you're installing is actually the thing you want. This'll drop you into a package selector.

The last method (I personally dislike this one, but whatever) is querying a query, for example:

```sh
paru -S $(paru -Ssq somenamehere)
```
will query a quiet search (only output the name, no version or anything extra) and pass the result as the thing you want.

### If you are installing a package from the AUR make sure to read through the pkgbuild, to make sure what you're installing is actually what it says it is and not a virus.
Once you're done reading, (first press q if you had to scroll and) press enter.

# For more info either read the pacman page on the Arch wiki or:

```sh
man pacman
```

```sh
man paru
```

man [yay](../../post-install%20tweaks/15.%20yay/instructions.md)