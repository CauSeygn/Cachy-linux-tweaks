# Preface
These are my fish shell binds and prompt, to use any of them (`printtime` function requires the line in `config.fish`) simply copy them to their expected location.

`fish_prompt` - modified preset of the `nim` style in `fish_config`

`printtime` - randomly colored summary of time taken (executing/spent in) any command ran from the terminal

`optdeps-review` - gives you an overview of everything's optional dependencies that changed since the last time you invoked it, its cache lives in `~/.cache/optdeps-review/` for you to do with as you please, it is intended to be run once immediately upon grabbing it to populate the data, and after that periodically (weeks-months) and manually, at your leisure, to review any accumulated extra optional dependencies that may have accrued over time since the last time you checked, without having to consult `/var/log/pacman.log` that shows you this info only once (when it is fresh) and never again

`pkgcacheclear` - destructively cleans up any directory you wish to let it clean (doesn't have to exist for `paru`/`yay`), like `pacman -Scc`, only it doesn't suck due to [a bug](https://gitlab.archlinux.org/pacman/pacman/-/work_items/297) and additionally cleans up AUR cache; default answer is yes, confirmed via `enter`, `y` or `Y`, for no `n` or `N`, `Ctrl + C` to quit out midway and anything else is rejected;\
Intended to be used periodically (weeks-months) to keep cache down on known good update states.

> [!WARNING]
Do **NOT** copy over nor use `optdeps-review` and `pkgcacheclear` into rootful interactive fish!

## Konsole
If you use Konsole, the `Shift+Right`, `Shift+Left` binds likely won't work.\
Either rebind them, or open Konsole, unbind these hotkeys in it, and
open the profile editor:
#### Settings -> Profiles (you have to make a new one) -> Edit profile.
#### Navigate to the keyboard tab, then go edit the Default (XFree 4) keyboard.
#### Click on add, and add two bindings (Pay attention to the order):

### on the left:

```sh
Left+Shift-Ctrl-Alt-AppScreen
Right+Shift-Ctrl-Alt-AppScreen
```

### on the right:

```sh
\E[1;*D
\E[1;*C
```

then save the bind list, now `Shift+Left` and `Shift+Right` will work once you re-enter Konsole.

## Rootful interactive fish
Bash is a downright horrible shell to find yourself in for the few times you may want to mess around as the root user, you can call `fish` afterwards if you like, but there's a simpler (and safe) way to autoinvoke fish whenever you run `su` or `sudo -s` (and under no circumstances in a non-interactive instance! (important to not break anything that expects bash or sh to run it ONLY!, but doesn't clarify)) to become root, open a terminal and type (see [micro](../../../6.%20micro%20text%20editor%20look%20and%20feel/home/.config/instructions.md) for auto-root as-needed privileges):
```sh
micro /root/.bashrc
```
and paste the following in:
```bash
case $- in
    *i*)
        if command -v fish >/dev/null 2>&1; then
            exec fish
        fi
        ;;
esac
```
this means that if bash is interactive, meaning the user invoked it in a terminal and NOT via a script, run this code (and the code it runs is to run fish directly, and not fish in bash);\
do the same with `/root/.bash_profile`:
```sh
micro /root/.bash_profile
```
pasting the exact same thing as above.

Lastly, to make use of anything discussed above (re-read the warning) in root's fish, run:
```sh
# Functions
sudo mkdir -p /root/.config/fish/functions/
```
```sh
# Bindings
sudo mkdir -p /root/.config/fish/conf.d/
```
<details id="pre-existing"><summary>pre-existing</summary>if instead you've ever already invoked fish as root, then these will already exist and have annoying to work with rootless modes set to them, in which case for every directory do:

```sh
# Don't set world unexecutable modes to directories that do not matter
sudo chmod 755 /root/.config/
sudo chmod 755 /root/.config/fish/
sudo chmod 755 /root/.config/fish/functions/
sudo chmod 755 /root/.config/fish/conf.d/
```
</details>

and copy the things you wish over, open a terminal here and **<u>(everything safe listed, exclude what you don't want)</u>** run:
```sh
# Bindings
sudo cp fish/conf.d/bindings.fish /root/.config/fish/conf.d/
# Functions
sudo cp fish/functions/fish_prompt.fish /root/.config/fish/functions/
sudo cp fish/functions/printtime.fish /root/.config/fish/functions/
```
finally, if you will use `printtime`, do NOT copy over the `config.fish` provided here, instead make a new/edit an existing one with:
```sh
micro /root/.config/fish/config.fish
```
and give it the contents of:
```sh
if status is-interactive
    # Commands to run in interactive sessions can go here
    functions -q printtime
end
```
## Also see `fish_config` and fish documentation website.