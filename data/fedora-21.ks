install
text
lang C
keyboard us
timezone --utc @TIMEZONE@
auth --useshadow --enablemd5
selinux --permissive
firewall --disabled
bootloader --location=mbr --driveorder vda,vdb --timeout=1
network --bootproto=dhcp --device=eth0 --onboot=on
network --bootproto=dhcp --device=eth1 --onboot=on
services --enabled=network
rootpw cluster
poweroff

#
# Disk configuration
#

bootloader --location=mbr --append="console=tty0 console=ttyS0,115200"
zerombr
clearpart --all --drives=vda,vdb --initlabel --disklabel=gpt

part biosboot --fstype=biosboot --size=1 --ondisk=vda
part / --fstype ext4 --size=@ROOTSIZE@ --ondisk=vda
part swap --size=@SWAPSIZE@ --fstype swap --ondisk=vda

# /dev/vdb is partitioned in scripts acording to cluster type

#
# Repositories
#
# This will be parsed for virt-install to download image
#IMAGE_TREE=http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/x86_64/os/

repo --name="Fedora" --mirrorlist="http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-21&arch=x86_64"
repo --name="FedoraUpdates" --mirrorlist="http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f21&arch=x86_64"
@REPOURL@

#
# Packages
#
%packages
@core

ntp
ntpdate

# This will be modified according to cluster type
# CLUSTER_PACKAGES

%end

%post

%end
