
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.63])

AC_INIT([cbox], 
	m4_esyscmd([make/git-version-gen .tarball-version]),
	[linux-cluster@redhat.com])

AM_INIT_AUTOMAKE([-Wno-portability dist-bzip2 dist-xz])

AC_CONFIG_SRCDIR([make/release.mk])

# Sanitize path

if test "$prefix" = "NONE"; then
	prefix="/usr"
	if test "$localstatedir" = "\${prefix}/var"; then
		localstatedir="/var"
	fi
	if test "$sysconfdir" = "\${prefix}/etc"; then
		sysconfdir="/etc"
	fi
	if test "$libdir" = "\${exec_prefix}/lib"; then
		if test -e /usr/lib64; then
			libdir="/usr/lib64"
		else
			libdir="/usr/lib"
		fi
	fi
fi

case $exec_prefix in
  NONE)   exec_prefix=$prefix;;
  prefix) exec_prefix=$prefix;;
esac

# Checks for programs.

# check stolen from gnulib/m4/gnu-make.m4
if ! ${MAKE-make} --version /cannot/make/this >/dev/null 2>&1; then
	AC_MSG_ERROR([you don't seem to have GNU make; it is required])
fi

AC_PROG_AWK
AC_PROG_SED
AC_PROG_LN_S
AC_PROG_INSTALL
AC_PROG_MAKE_SET

AC_CHECK_PROGS([APPCREATOR],[appliance-creator])
if test -z "$APPCREATOR"; then
	AC_MSG_ERROR([you don't seem to have appliance-creator; it is required])
fi

AC_PATH_TOOL([CBOXEMULATOR],[qemu-kvm],,[/usr/bin:/usr/libexec])
if test -z "$CBOXEMULATOR"; then
	AC_MSG_ERROR([you don't seem to have qemu-kvm; it is required])
fi

# local options
AC_ARG_ENABLE([debug],
	[  --enable-debug          enable debug build. ],
	[ default="no" ])

## random vars

CBOXLOGDIR=${localstatedir}/log/cbox
CBOXDATADIR=${datadir}/cbox

## do subst

AC_SUBST([CBOXLOGDIR])
AC_SUBST([CBOXDATADIR])
AC_SUBST([CBOXEMULATOR])

AC_CONFIG_FILES([
		 Makefile
		 data/Makefile
		 hooks/Makefile
		])

AC_OUTPUT
