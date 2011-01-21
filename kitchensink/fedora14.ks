lang C
keyboard us
timezone US/Eastern
auth --useshadow --enablemd5
selinux --permissive
firewall --disabled
bootloader --timeout=1 --append="selinux=0"
network --bootproto=dhcp --device=eth0 --onboot=on
services --enabled=network

# Uncomment the next line
# to make the root password be thincrust
# By default the root password is emptied
#rootpw --iscrypted $1$uw6MV$m6VtUWPed4SqgoW6fKfTZ/

device virtio_blk

#
# Partition Information. Change this as necessary
# This information is used by appliance-tools but
# not by the livecd tools.
#
part / --size 4096 --fstype ext3 --ondisk vda

#
# Repositories
#
# To compose against the current release tree, use the following "repo" (enabled by default)
repo --name="Fedora 14 - x86_64" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-14&arch=$basearch
repo --name="Fedora 14 - x86_64 - Updates" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f14&arch=$basearch

# To compose against rawhide, use the following "repo" (disabled by default)
#repo --name=rawhide --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch

#
# Add all the packages after the base packages
#
%packages --nobase
bash
kernel
grub
e2fsprogs
passwd
policycoreutils
chkconfig
rootfiles
yum
vim
acpid
#needed to disable selinux
lokkit

#Allow for dhcp access
dhclient
iputils

#
# Packages to Remove
#

# no need for kudzu if the hardware doesn't change
-kudzu
-prelink
-setserial
-ed

# Remove the authconfig pieces
-authconfig
-rhpl
-wireless-tools

# Remove the kbd bits
-kbd
-usermode

# these are all kind of overkill but get pulled in by mkinitrd ordering
-mkinitrd
-kpartx
-dmraid
-mdadm

# selinux toolchain of policycoreutils, libsemanage, ustr
-policycoreutils
-checkpolicy
-selinux-policy*
-libselinux-python
-libselinux

# Things it would be nice to loose
-fedora-logos
generic-logos
-fedora-release-notes

openssh-server
corosync
cman
fence-agents
resource-agents
rgmanager
pacemaker
lvm2-cluster
cmirror
rsyslog

%end

#
# Add custom post scripts after the base post.
#
%post

%end

