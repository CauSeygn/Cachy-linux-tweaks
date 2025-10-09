# These are my fish shell binds and prompt, to use them simply copy them to their expected location.

## If you use Konsole, the Shift+Right, Shift+Left binds likely won't work.
Either rebind them, or open Konsole, unbind these hotkeys in it, and
open the profile editor:
### Settings -> Profiles (you have to make a new one) -> Edit profile.
### Navigate to the keyboard tab, then go edit the Default (XFree 4) keyboard.
### Click on add, and add two bindings (Pay attention to the order):

## on the left:

```sh
Left+Shift-Ctrl-Alt-AppScreen
Right+Shift-Ctrl-Alt-AppScreen
```

## on the right:

```sh
\E[1;*D
\E[1;*C
```

then save the bind list, now Shift+Left and Shift+Right will work once you re-enter Konsole.
## Also see `fish_config` and fish documentation website.