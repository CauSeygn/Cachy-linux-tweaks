# Search for specific packages:
You can use either [yay](../../post-install%20tweaks/0.%20yay/instructions.md) or pacman, the syntax is the same, I prefer yay, as it has some QOL. The following showcases yay, pacman is the exact same syntax.

```sh
yay -Ss searchquery
```

The `searchquery` doesn't need to be one word.

# If you want more info on a specific package:

```sh
yay -Si nameofpackage
```

# If you want even more info:

```sh
yay -Sii nameofpackage
```

# To install packages:

You have two methods with pacman (note such operations as installing and removing need sudo for pacman, yay autoinvokes it), three with yay, the first is:

```sh
yay -S nameofpackage
```

The name must be correct in this case.\
(Note: you can also specify a repo - example: `aur/nameofpackage`)

The second (yay-specific) is:

```sh
yay vaguename
```

In this case the name does not need to be correct, but make sure what you're installing is actually the thing you want. This'll drop you into a package selector.

The last method (I personally dislike this one, but whatever) is querying a query, for example:

```sh
yay -S $(yay -Ssq somenamehere)
```
will query a quiet search (only output the name, no version or anything extra) and pass the result as the thing you want.

### If you are installing a package from the AUR make sure to read through the PKGBUILD, to make sure what you're installing is actually what it says it is and not a virus.
Once you're done reading, (first press q if you had to scroll and) press enter.

# For more info either read the pacman page on the Arch wiki or:

```sh
man pacman
```

```sh
man yay
```