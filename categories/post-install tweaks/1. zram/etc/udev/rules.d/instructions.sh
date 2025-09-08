# Open the terminal and do:

sudo cp 30-zram.rules /etc/udev/rules.d/30-zram.rules

# The config will take effect on next boot.
# This file increases the aggressiveness of swapping dramatically
# over Cachy's default, meaning the system will swap in and swap out
# RAM on an earlier percentage to full.