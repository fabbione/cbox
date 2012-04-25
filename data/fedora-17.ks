lang C
keyboard us
timezone @TIMEZONE@
auth --useshadow --enablemd5
selinux --permissive
firewall --disabled
bootloader --location=mbr --driveorder vda,vdb --timeout=1 --append="selinux=0"
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

part biosboot --size 1 --fstype biosboot --ondisk vda
part / --size @ROOTSIZE@ --fstype ext4 --ondisk vda
part swap --size @SWAPSIZE@ --fstype swap --ondisk vda

# temporary workaround to get the image created easily
# appliance creator cannot handle it if gpt is used, moved out
#part /srv/cbox/qdiskd --size @QDISKDSIZE@ --fstype ext4 --ondisk vdb
#part /srv/cbox/gfs2 --size @GFS2SIZE@ --fstype ext4 --ondisk vdb
#part /srv/cbox/clvmd --size @CLVMDSIZE@ --fstype ext4 --ondisk vdb


#
# Repositories
#
repo --name="Fedora 17 - x86_64" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-17&arch=$basearch
repo --name="Fedora 17 - x86_64 - Updates" --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f17&arch=$basearch

#
# Add all the packages after the base packages
#
%packages
bash
kernel
kernel-modules-extra
less
grub2
e2fsprogs
passwd
policycoreutils
chkconfig
rootfiles
yum
vim
acpid
dbus
#needed to disable selinux
lokkit
parted

#Allow for dhcp access
dhclient
iputils

#
# Packages to Remove
#

# no need for kudzu if the hardware doesn't change
-prelink
-setserial
-ed

# Remove the authconfig pieces
-authconfig
-wireless-tools

# Remove the kbd bits
-kbd
-usermode

# these are all kind of overkill but get pulled in by mkinitrd ordering
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
dlm
cluster-glue
fence-agents
resource-agents
rgmanager
pacemaker
lvm2-cluster
cmirror
gfs2-utils
rsyslog
ntp
ntpdate

%end

#
# Add custom post scripts after the base post.
#
%post

%end
