install
text
lang C
keyboard us
timezone --utc @TIMEZONE@
auth --enableshadow --passalgo=sha512
selinux --permissive
firewall --disabled
bootloader --location=mbr --driveorder vda,vdb --timeout=1
network --bootproto=dhcp --device=eth0 --onboot=on --activate
network --bootproto=dhcp --device=eth1 --onboot=on --activate
services --enabled=network
rootpw cluster
poweroff

#
# Disk configuration
#

bootloader --location=mbr --append="console=tty0 console=ttyS0,115200"
zerombr
clearpart --all --drives=vda,vdb --initlabel

#part biosboot --fstype=biosboot --size=1 --ondisk=vda
part / --fstype ext4 --size=@ROOTSIZE@ --ondisk=vda
part swap --size=@SWAPSIZE@ --fstype swap --ondisk=vda

# /dev/vdb is partitioned in scripts acording to cluster type

#
# Repositories
#
# This will be parsed for virt-install to download image
#IMAGE_TREE=http://mirrors.kernel.org/centos/7.1.1503/os/x86_64
repo --name="RHEL7"   --mirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os
repo --name="RHEL7U"  --mirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=updates
repo --name="RHEL7E"  --mirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=extras
repo --name="EPEL7"   --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=x86_64

@REPOURL@

#
# Packages
#
%packages
@core
epel-release

ntp
ntpdate

# This will be modified according to cluster type
# CLUSTER_PACKAGES

%end

%post
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

%end
