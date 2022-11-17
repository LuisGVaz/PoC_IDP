# https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/


# installing libguestfs-tools only required once, prior to first run
sudo apt update -y
sudo apt install libguestfs-tools -y
# remove existing image in case last execution did not complete successfully
rm focal-server-cloudimg-amd64.img
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img ## TODO Change this Ubuntu version with the last one.
sudo virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent
sudo qm create 9000 --name "ubuntu-2004-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
sudo qm importdisk 9000 focal-server-cloudimg-amd64.img local-zfs
sudo qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-9000-disk-0
sudo qm set 9000 --boot c --bootdisk scsi0
sudo qm set 9000 --ide2 local-zfs:cloudinit # TODO Do some review about this topic. local-lvm is our current option.
sudo qm set 9000 --serial0 socket --vga serial0
sudo qm set 9000 --agent enabled=1
sudo qm template 9000
rm focal-server-cloudimg-amd64.img
echo "next up, clone VM, then expand the disk"
echo "you also still need to copy ssh keys to the newly cloned VM"