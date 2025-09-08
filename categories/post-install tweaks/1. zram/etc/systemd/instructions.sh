# Within zram-generator.conf file feel free to change the following line:

zram-size = ram * 1.5

# Set the number here to something between 1 and 3 (Cachy default is 1)
# then simply save the file, open the terminal and do:

sudo cp zram-generator.conf /etc/systemd/zram-generator.conf

# The config will take effect on next login/boot.
# Reasoning: if you need more swap space - LLM's or low base RAM - zRAM
# has almost no downsides aside from slightly busying the CPU during
# compression and slightly increased base RAM usage, the higher you go.