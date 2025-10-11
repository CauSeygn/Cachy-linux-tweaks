# Preface
This will change the default cpu governor from automanaged to manually managed.

## Tweak the following line:

```sh
governor='performance'
```

to whichever profile you want, afterwards open terminal here and run:

```sh
sudo cp cpupower /etc/default/cpupower
systemctl enable cpupower.service
```

either line by line, or at once (newlining things are treated as separate commands, go read more on that if you want, other things such as `command1 && command2` also work).

## If your CPU is AMD:
then additionally edit `/etc/default/limine`, to include:

`amd_pstate=passive`

### Example:

```sh
KERNEL_CMDLINE[default]="quiet nowatchdog splash amd_pstate=passive initcall_blacklist=acpi_cpufreq_init rw rootflags=subvol=/@ root=UUID=a9a0b235-04ba-4d62-ae4a-21b7a9723c89"
```

# Afterwards, run:

```sh
sudo limine-mkinitcpio
```

These will take effect next boot.