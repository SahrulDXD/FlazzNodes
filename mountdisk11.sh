#!/bin/bash
sudo parted /dev/nvme1n1 --script mklabel gpt mkpart xfspart xfs 0% 100%
sleep 5
sudo mkfs.xfs /dev/nvme1n1p1
sleep 5
sudo partprobe /dev/nvme1n1p1
sleep 5
sudo mount /dev/nvme1n1p1 /var/lib/pterodactyl/volumes
sleep 5
UUID_MOUNT=$(blkid /dev/nvme1n1p1 -s UUID -o value);
echo "UUID=${UUID_MOUNT}   /var/lib/pterodactyl/volumes   xfs   defaults,nofail   1   2" >> /etc/fstab
