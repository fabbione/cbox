MAINTAINERCLEANFILES	= Makefile.in

KICKSTARTS		= fedora-13.ks \
			  fedora-14.ks \
			  fedora-15.ks \
			  fedora-16.ks \
			  fedora-17.ks \
			  fedora-18.ks \
			  fedora-21.ks \
			  fedora-rawhide.ks \
			  packages_cman.ks \
			  packages_corosync.ks \
			  packages_ceph.ks

TEMPLATES		= libvirt_template.xml

EXTRA_DIST		= $(KICKSTARTS) $(TEMPLATES)

cboxdatadir		= $(CBOXDATADIR)

cboxdata_DATA		= $(KICKSTARTS) $(TEMPLATES)
