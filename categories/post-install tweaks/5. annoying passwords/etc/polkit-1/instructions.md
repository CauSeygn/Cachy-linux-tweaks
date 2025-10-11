# Sudo:
Tweak `/etc/sudoers`, by running (substitute `micro` for whichever editor you're comfortable using, default without variable is vi):

```sh
sudo EDITOR=micro visudo
```

## To entirely disable
password prompts when running sudo (note that my username is banana308, substitute with yours naturally), locate the following:

```sh
## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
```

and just before that add (note the username):

```sh
Defaults:banana308 !authenticate
```

### Like so (note the username):

```sh
Defaults:banana308 !authenticate

## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
```

## To see the typed password as stars instead
when you type within a sudo prompt, add this:

```sh
Defaults pwfeedback
```

### Like so:

```sh
Defaults pwfeedback

## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
```

Then save and exit, depending on what you did, you'll see the immediate effect.

# Polkit:
To disable password prompts on the GUI side of things, open the terminal here and type:

```sh
sudo cp 49-nopasswd_global.rules /etc/polkit-1/rules.d/49-nopasswd_global.rules
```

The rule will disable GUI password prompts for users in the wheel group. Disabling both password prompt in sudo and password prompt in polkit effectively disables password prompts when performing admin actions entirely, system-wide.

# If you think this is unsafe, then I have bad news for you if you're the only one using your computer.
Alternatively read the Arch wiki on sudo if you want to spend 5 years excluding commands one by one on both or one end.