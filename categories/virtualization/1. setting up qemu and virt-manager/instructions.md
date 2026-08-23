# To grab these go open a terminal and type:

```sh
# You only need swtpm if your motherboard lacks a compatible module and you want to run W11
yay -S qemu-full virt-manager swtpm
```

# After that is done, you can run:

```sh
systemctl enable --now libvirtd.socket
systemctl enable --now libvirtd.service
sudo virsh net-autostart default
```

These three will enable the necessary things, with the last one automatically bringing internet up in a virtual machine whenever it's started. Now open up virt-manager from the app menu and create vm's.