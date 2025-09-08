# To grab these go open a terminal and type:

paru -S qemu-full

# To grab virt-manager, you can go to cachy-hello ->
# install apps (tick advanced) -> virtual computing -> virt-manager
# (alternatively use paru and just append 'virt-manager').

# After that is done, you can run:

systemctl enable --now libvirtd.socket
systemctl enable --now libvirtd.service
sudo virsh net-autostart default

# These three will enable the necessary things, with the last one
# automatically bringing internet up in a virtual machine whenever it's
# started. Now open up virt-manager from the app menu and create vm's.