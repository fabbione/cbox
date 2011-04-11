MAINTAINERCLEANFILES	= Makefile.in

HOOKS			= 01_host_update \
			  02_host_install_packages \
			  03_host_net_setup \
			  04_host_fence_setup \
			  05_host_create_ssh_keys \
			  06_host_create_guest_kickstart \
			  07_host_ntp_setup \
			  50_guest_create \
			  51_guest_mount \
			  52_guest_net_setup \
			  53_guest_fstab_setup \
			  54_guest_install_ssh_keys \
			  55_guest_create_cluster_conf \
			  58_guest_apply_hacks_prerun \
			  59_guest_umount \
			  60_guest_create_first_node \
			  61_guest_start_first \
			  62_guest_setup_clvmd \
			  63_guest_setup_gfs2 \
			  64_guest_setup_qdiskd \
			  67_guest_enable_daemons \
			  68_guest_apply_hacks_live \
			  69_guest_stop_first \
			  70_guest_clone_nodes \
			  71_guest_autostart_nodes \
			  72_guest_start_nodes \
			  99_final_cleanup

EXTRA_DIST		= $(HOOKS)

cboxhooksdir		= $(CBOXDATADIR)/hooks

cboxhooks_SCRIPTS	= $(HOOKS)
