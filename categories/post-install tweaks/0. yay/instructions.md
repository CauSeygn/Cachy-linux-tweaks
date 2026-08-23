# Preface
I was tired of waiting on paru to fix its shit relating to AUR tab-completions, thus I switched over to yay.

## How to?
It is simple, open the terminal and after updating your system (if it is too out of date) type:
```sh
# Clone the yay package repo
git clone https://aur.archlinux.org/yay.git
```
followed by:
```sh
# Change directory into it
cd yay/
```
---
<details><summary><strong>AUR Handling</strong></summary>
After this, you would normally want to review the `PKGBUILD` of it, unnecessary this time around, but I'll list it out anyway, you would now type:

```sh
less PKGBUILD
```

which will put you in a pager called `less`, you move using the arrow keys and page up/down buttons, when you confirm everything is legitimate, you would then press `q` to exit. This is what you will land on every single time you use `yay` to install a package for the first time.
</details>

---
followed by:
```sh
# Build, then install package
makepkg -si
```
now that `yay` is installed, run:
```sh
yay --gendb
```
so it learns what is on your system, finally, run:
```sh
yay
```
to generate a default config file, in `~/.config/yay/` (this will also update your system). Navigate here and edit this file as you please, for the sake of convenience, I will include mine for what I consider sane defaults.
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
if you do not use flatpak, uncomment `NoFlatpak`, uncomment `AURHelper` and change to `yay`.

# Final note
The usage of yay is nearly identical to that of pacman, for more info `man yay`.