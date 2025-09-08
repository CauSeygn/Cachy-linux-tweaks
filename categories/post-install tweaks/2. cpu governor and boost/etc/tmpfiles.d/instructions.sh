# Depending on your CPU (AMD/Intel) tweak the following:

w /sys/devices/system/cpu/cpufreq/boost - - - - 0

# AMD values: 0 - off, 1 - on
# Intel values: 1 - off, 0 - on, additionally, for Intel:

w /sys/devices/system/cpu/intel_pstate/no_turbo - - - - 1

# Then save the file, open the terminal and do:

sudo cp disable-cpu-boost.conf /etc/tmpfiles.d/disable-cpu-boost.conf

# The config will take effect on next boot.
# If you want to enable boost for the duration of the boot,
# open the terminal from anywhere and do (AMD example, see above for Intel):

echo "1" | sudo tee /sys/devices/system/cpu/cpufreq/boost

# Naturally to disable it, echo 0 (for AMD) or reboot.