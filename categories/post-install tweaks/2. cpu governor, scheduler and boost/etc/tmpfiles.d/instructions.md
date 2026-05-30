# Depending on your CPU (AMD/Intel) tweak the following:

```sh
w /sys/devices/system/cpu/cpufreq/boost - - - - 0
```

| Processor | Value | State |
| :-------- | :---: | ----: |
| AMD       |   0   |   off |
| AMD       |   1   |    on |

```sh
w /sys/devices/system/cpu/intel_pstate/no_turbo - - - - 1
```

| Processor | Value | State |
| :-------- | :---: | ----: |
| Intel     |   0   |    on |
| Intel     |   1   |   off |

### Then save the file, open the terminal here and do:

```sh
sudo cp disable-cpu-boost.conf /etc/tmpfiles.d/disable-cpu-boost.conf
```

The config will take effect on next boot. If you want to enable boost for the duration of the boot, open the terminal from anywhere and do (AMD example, see above for Intel):

```sh
echo "1" | sudo tee /sys/devices/system/cpu/cpufreq/boost
```

Naturally to disable it, echo 0 (for AMD) or reboot.