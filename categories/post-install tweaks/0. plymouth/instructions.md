# Preface
Do you like your boot messages hidden from you?

Do you like your boot sequence getting stuck?

Ye- no? Hm, weird; well then, here's how to fix Plymouth (by deleting it off the system).

# First
Use your favorite text editor to edit `/etc/default/limine`. In `KERNEL_CMDLINE` you want to remove `quiet` and `splash` parameters. Save the file and exit.

**(`quiet` hides boot messages, `splash` runs plymouth)**

# Second
Use your favorite text editor to edit `/etc/mkinitcpio.conf`. Find the uncommented (no `#` symbol in front of the line) `HOOKS` entry and remove `plymouth` from there. Save the file and exit.

# Third
Open the terminal and run:
```sh
sudo limine-mkinitcpio
```
to regenerate the kernel images without this garbage software in it. Now you can run:
```sh
paru -Rns plymouth
```
to remove this garbage and return to sanity, congratulations.