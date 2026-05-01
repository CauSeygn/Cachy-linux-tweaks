# Preface
manpages are great, but navigating them from the terminal where you are likely viewing them, is a pita stuck in the 80s, thus this

## Install
Open a terminal and type:
```sh
yay -S qman
```

## Config
Out of the box config is mostly sane, except for how mouse works in a mouse-supported tui.

Open a terminal and type:
```sh
cp -ri /etc/xdg/qman .config
```
then navigate to `.config/qman/` and open `qman.conf`. Under mouse section, add `left_click_open=   true`, save and close, that's it.

### For more info, visit:
https://github.com/plp13/qman/blob/main/man/qman.1.md