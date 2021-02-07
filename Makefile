SHELL=/bin/bash

ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644

all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

archive:
	git archive --format=tar.gz --prefix=daemonscripts-master/ master > daemonscripts-master.tar.gz

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/init.d
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

create-service-dir:
	install -d -m ${DIRMODE} ${LIBDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} services/dhcpcd ${LIBDIR}

install-service-wpa: create-service-dir
	install -m ${MODE} services/wpa ${LIBDIR}

install-dhcpd: create-dirs
	install -m ${MODE} init.d/dhcpd ${EXTDIR}/init.d/dhcpd
	install -m ${CONFMODE} sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd

install-fcron: create-dirs
	install -m ${MODE} init.d/fcron ${EXTDIR}/init.d/

install-ntpd: create-dirs
	install -m ${MODE} init.d/ntpd ${EXTDIR}/init.d/

install-sshd: create-dirs
	install -m ${MODE} init.d/sshd ${EXTDIR}/init.d/

install-rpcbind: create-dirs
	install -m ${MODE} init.d/rpcbind ${EXTDIR}/init.d/

install-dovecot: create-dirs
	install -m ${MODE} init.d/dovecot ${EXTDIR}/init.d/

install-exim: create-dirs
	install -m ${MODE} init.d/exim ${EXTDIR}/init.d/

install-unbound: create-dirs
	install -m ${MODE} init.d/unbound ${EXTDIR}/init.d/

install-nfs-client: create-dirs
	install -m ${MODE} init.d/nfs-client ${EXTDIR}/init.d/

install-nfs-server: create-dirs
	install -m ${MODE} init.d/nfs-server ${EXTDIR}/init.d/

.PHONY: all archive create-dirs create-service-dir \
	install-service-dhcpcd \
	install-service-wpa \
	install-dhcpd \
	install-fcron \
	install-ntpd \
	install-sshd
