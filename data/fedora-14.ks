lang C
keyboard us
timezone US/Eastern
auth --useshadow --enablemd5
selinux --permissive
firewall --disabled
bootloader --timeout=1 --append="selinux=0"
network --bootproto=dhcp --device=eth0 --onboot=on
network --bootproto=dhcp --device=eth1 --onboot=on
services --enabled=network

# Uncomment the next line
# to make the root password be thincrust
# By default the root password is emptied
rootpw cluster

device virtio_blk

#
# Partition Information. Change this as necessary
# This information is used by appliance-tools but
# not by the livecd tools.
#
part / --size @ROOTSIZE@ --fstype ext3 --ondisk vda
part swap --size @SWAPSIZE@ --fstype swap --ondisk vda

# temporary workaround to get the image created easily
part /srv/cbox/qdiskd --size @QDISKDSIZE@ --fstype ext3 --ondisk vdb
part /srv/cbox/gfs2 --size @GFS2SIZE@ --fstype ext3 --ondisk vdb
part /srv/cbox/clvmd --size @CLVMDSIZE@ --fstype ext3 --ondisk vdb

#
# Repositories
#
repo --name="Fedora 14 - x86_64" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-14&arch=$basearch
repo --name="Fedora 14 - x86_64 - Updates" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f14&arch=$basearch

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
gfs2-utils
gfs2-cluster
rsyslog

%end

#
# Add custom post scripts after the base post.
#
%post

%end

