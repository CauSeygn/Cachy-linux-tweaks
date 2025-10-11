# Adding locales:
Tweak `/etc/locale.gen`, by uncommenting any locales you want to add, comments are denoted by '#' so simply delete any infront of the locales you want, example (will open the file in kate):

```sh
kate /etc/locale.gen
```

### If you play visual novels, you want to uncomment the `ja_JP.UTF-8` locale, otherwise characters won't render properly or the game won't even run.

## Afterwards, run:

```sh
sudo locale-gen
```

This will regenerate locales on the system.