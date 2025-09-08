# Tweak the following line:

governor='performance'

# to whichever profile you want,
# afterwards run:

sudo cp cpupower /etc/default/cpupower
systemctl enable cpupower.service

# If your CPU is AMD, then additionally edit /etc/default/limine, to include:

amd_pstate=passive

# Example:

KERNEL_CMDLINE[default]="quiet nowatchdog splash amd_pstate=passive initcall_blacklist=acpi_cpufreq_init rw rootflags=subvol=/@ root=UUID=a9a0b235-04ba-4d62-ae4a-21b7a9723c89"

# Afterwards, run:

sudo limine-mkinitcpio

# This will take effect next boot.