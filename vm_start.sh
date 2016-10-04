#!/bin/sh

base=/home/${SUDO_USER:-$USER}

qemu-system-x86_64 -smp 4 -m 512 -kernel arch/x86/boot/bzImage -initrd ${base}/qemu/ramfs.gz \
	-net nic,model=virtio -net tap,script=${base}/qemu/tap_up.sh,downscript=no \
	-append "debug console=ttyS0" \
	-enable-kvm -nographic
