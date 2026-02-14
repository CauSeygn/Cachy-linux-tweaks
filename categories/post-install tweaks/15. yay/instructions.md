# Preface
I was tired of waiting on paru to fix its shit relating to AUR tab-completions, thus I switched over to yay.

## How to?
It is simple, open the terminal and after updating your system (if it is too out of date) type:
```sh
paru -S yay
```
now run:
```sh
yay --gendb
```
so it learns what is on your system, finally, run:
```sh
yay
```
to generate a default config file, in `~/.config/yay/`. Navigate here and edit this file as you please, for the sake of convenience, I will include mine for what I consider sane defaults
#### <strong><u>**BUT NOTE THAT YOU HAVE TO REPLACE THE `buildDir` PATH WITH YOUR USERNAME!**</u></strong>

### Cachy-update
If you use it, then it needs to migrate with you to yay as well. Open the terminal and type:
```sh
arch-update --gen-config
```
then:
```sh
# Or your favorite text editor, if you don't like micro
micro .config/arch-update/arch-update.conf
```
if you do not use use flatpak, uncomment `NoFlatpak`, uncomment `AURHelper` and change to `yay`.

# Final note
The usage of yay is nearly identical to that of paru, for more info `man yay`.