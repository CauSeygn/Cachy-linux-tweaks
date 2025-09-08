# Virtio-venus is a 3D accelerated driver that works in Linux and android
# virtual machines. To use it, the virtual machine needs to be in a user
# session and not the root one. If you know how to create such a vm in
# qemu cli then skip to the end.

# If not, then open up virt-manager and click on file -> add connection...
# -> qemu/kvm user session. Create a virtual machine regularly (override
# any settings that are defaulting to outdated things to virtio) and install
# the OS, then close out of virt-manager.

# Example:
# Chipset: Q35
# Firmware: UEFI
# CPU: passthrough
# Disk: VirtIO
# CDROM: SATA
# NIC: usermode, model: virtio
# Display: Spice
# Sound: ich9
# Video: Virtio

# After installing the OS, you can open up the terminal and create a qemu-cli
# prompt for your virtual machine, here's an example of my CachyOS VM:

qemu-system-x86_64                                                                             \
    -enable-kvm                                                                                \
    -M q35                                                                                     \
    -smp 6                                                                                     \
    -m 12G                                                                                     \
    -cpu host                                                                                  \
    -net nic,model=virtio                                                                      \
    -net user,hostfwd=tcp::2222-:22                                                            \
    -device virtio-sound-pci,audiodev=my_audiodev -audiodev pipewire,id=my_audiodev            \
    -device virtio-vga-gl,hostmem=4G,blob=true,venus=true                                      \
    -vga none                                                                                  \
    -display gtk,gl=on,show-cursor=on                                                          \
    -usb -device usb-tablet                                                                    \
    -object memory-backend-memfd,id=mem1,size=12G                                              \
    -machine memory-backend=mem1                                                               \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.secboot.4m.fd   \
    -drive if=pflash,format=raw,file=.config/libvirt/qemu/nvram/archlinux_VARS.fd              \
    -drive file=.local/share/libvirt/images/archlinux.qcow2

# To explain:

# '-smp 6' means 6 cpu cores

# '-m 12G' means 12GB of RAM

# '-net user,hostfwd=tcp::2222-:22' means the port 22 is being forwarded from the host to the vm
# as port 2222, thus if you wanted an ssh connection the vm from some device, you'd do:

ssh -p 2222 vmusername@vmlocalhost

# Check post-install tweaks/12. for ssh

# '-device virtio-vga-gl,hostmem=4G,blob=true,venus=true' this is the venus driver, unfortunately
# not yet in virt-manager, once it is, this entire section apart from user mode will be superceded.
# 'hostmem=4G' means I'm letting the vm have up to 4GB of my VRAM from my GPU.

# '-object memory-backend-memfd,id=mem1,size=12G' in this section, the size is the RAM you gave it,
# thus 12GB in my case.

# '-drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.secboot.4m.fd' this
# is the bios file for the vm, this is just the path to it.

# '-drive if=pflash,format=raw,file=.config/libvirt/qemu/nvram/archlinux_VARS.fd' this is the
# nvram of the vm, without this or with this set to read-only, the vm won't run.

# '-drive file=.local/share/libvirt/images/archlinux.qcow2' this is the path to the qcow2 file
# (the storage of the vm).

# You can see my audio device isn't ich9 in this case but pipewire, this is irrelevant.