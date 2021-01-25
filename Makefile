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

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/init.d
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

create-service-dir:
	install -d -m ${DIRMODE} ${LIBDIR}

install-service-dhclient: create-service-dir
	install -m ${MODE} services/dhclient ${LIBDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} services/dhcpcd  ${LIBDIR}

install-service-bridge: create-service-dir
	install -m ${MODE} services/bridge  ${LIBDIR}

install-service-ipx: create-service-dir
	install -m ${MODE} services/ipx ${LIBDIR}

install-service-pppoe: create-service-dir
	install -m ${MODE} services/pppoe  ${LIBDIR}
	install -d -m ${DIRMODE} ${EXTDIR}/ppp/peers
	install -m ${CONFMODE} ppp/pppoe ${EXTDIR}/ppp/peers

install-service-wpa: create-service-dir
	install -m ${MODE} services/wpa ${LIBDIR}

install-accounts-daemon: create-dirs
	install -m ${MODE} init.d/accounts-daemon ${EXTDIR}/rc.d/init.d/

install-acpid: create-dirs
	install -m ${MODE} init.d/acpid       ${EXTDIR}/rc.d/init.d/

install-alsa: create-dirs
	install -m ${MODE} init.d/alsa       ${EXTDIR}/rc.d/init.d/

install-httpd: create-dirs
	install -m ${MODE} init.d/httpd     ${EXTDIR}/rc.d/init.d/

install-php: create-dirs
	install -m ${MODE} init.d/php-fpm     ${EXTDIR}/rc.d/init.d/

install-autofs: create-dirs
	install -m $(MODE) init.d/autofs    $(EXTDIR)/rc.d/init.d/
	install -m $(CONFMODE) sysconfig/autofs.conf $(EXTDIR)/sysconfig/

install-atd: create-dirs
	install -m ${MODE} init.d/atd       ${EXTDIR}/rc.d/init.d/

install-avahi: create-dirs
	install -m ${MODE} init.d/avahi     ${EXTDIR}/rc.d/init.d/

install-bind: create-dirs
	install -m ${MODE} init.d/bind       ${EXTDIR}/rc.d/init.d/

install-bluetooth: create-dirs
	install -m ${MODE} init.d/bluetooth ${EXTDIR}/rc.d/init.d/bluetooth
	install -m ${CONFMODE} sysconfig/bluetooth ${EXTDIR}/sysconfig/bluetooth

install-cups: create-dirs
	install -m ${MODE} init.d/cups       ${EXTDIR}/rc.d/init.d/

install-saslauthd: create-dirs
	install -m ${MODE} init.d/saslauthd ${EXTDIR}/rc.d/init.d/saslauthd
	install -m ${CONFMODE} sysconfig/saslauthd ${EXTDIR}/sysconfig/saslauthd

install-dbus: create-dirs
	install -m ${MODE} init.d/dbus ${EXTDIR}/rc.d/init.d/

install-dovecot: create-dirs
	install -m ${MODE} init.d/dovecot       ${EXTDIR}/rc.d/init.d/

install-wicd: create-dirs
	install -m ${MODE} init.d/wicd ${EXTDIR}/rc.d/init.d/

install-dhcpd: create-dirs
	install -m ${MODE} init.d/dhcpd       ${EXTDIR}/rc.d/init.d/dhcpd
	install -m ${CONFMODE} sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd

install-exim: create-dirs
	install -m ${MODE} init.d/exim       ${EXTDIR}/rc.d/init.d/

install-fcron: create-dirs
	install -m ${MODE} init.d/fcron      ${EXTDIR}/rc.d/init.d/

install-firewalld: create-dirs
	install -m ${MODE} init.d/firewalld   ${EXTDIR}/rc.d/init.d/

install-gdm: create-dirs
	install -m ${MODE} init.d/gdm        ${EXTDIR}/rc.d/init.d/

install-gpm: create-dirs
	install -m ${MODE} init.d/gpm        ${EXTDIR}/rc.d/init.d/

install-haveged: create-dirs
	install -m ${MODE} init.d/haveged        ${EXTDIR}/rc.d/init.d/

install-heimdal: create-dirs
	install -m ${MODE} init.d/heimdal        ${EXTDIR}/rc.d/init.d/

install-iptables: create-dirs
	install -m ${MODE} init.d/iptables        ${EXTDIR}/rc.d/init.d/

install-krb5: create-dirs
	install -m ${MODE} init.d/krb5 ${EXTDIR}/rc.d/init.d/

install-lprng: create-dirs
	install -m ${MODE} init.d/lprng      ${EXTDIR}/rc.d/init.d/

install-lxdm: create-dirs
	install -m ${MODE} init.d/lxdm        ${EXTDIR}/rc.d/init.d/

install-mysql: create-dirs
	install -m ${MODE} init.d/mysql      ${EXTDIR}/rc.d/init.d/

install-netfs: create-dirs
	install -m ${MODE} init.d/netfs      ${EXTDIR}/rc.d/init.d/

install-networkmanager: create-dirs
	install -m ${MODE} init.d/networkmanager ${EXTDIR}/rc.d/init.d/networkmanager

install-nfs-client: create-dirs
	install -m ${MODE} init.d/nfs-client ${EXTDIR}/rc.d/init.d/

install-nfs-server: create-dirs
	install -m ${MODE} init.d/nfs-server ${EXTDIR}/rc.d/init.d/

install-ntpd: create-dirs
	install -m ${MODE} init.d/ntpd       ${EXTDIR}/rc.d/init.d/

install-slapd: create-dirs
	install -m ${MODE} init.d/slapd ${EXTDIR}/rc.d/init.d/slapd
	install -m ${CONFMODE} sysconfig/slapd ${EXTDIR}/sysconfig/slapd

install-postfix: create-dirs
	install -m ${MODE} init.d/postfix    ${EXTDIR}/rc.d/init.d/

install-postgresql: create-dirs
	install -m ${MODE} init.d/postgresql ${EXTDIR}/rc.d/init.d/

install-proftpd: create-dirs
	install -m ${MODE} init.d/proftpd    ${EXTDIR}/rc.d/init.d/

install-random: create-dirs
	install -m ${MODE} init.d/random     ${EXTDIR}/rc.d/init.d/

install-rpcbind: create-dirs
	install -m ${MODE} init.d/rpcbind    ${EXTDIR}/rc.d/init.d/

install-rsyncd: create-dirs
	install -m ${MODE} init.d/rsyncd     ${EXTDIR}/rc.d/init.d/

install-samba: create-dirs
	install -m ${MODE} init.d/samba      ${EXTDIR}/rc.d/init.d/

install-sddm: create-dirs
	install -m ${MODE} init.d/sddm        ${EXTDIR}/rc.d/init.d/

install-lightdm: create-dirs
	install -m ${MODE} init.d/lightdm        ${EXTDIR}/rc.d/init.d/

install-sendmail: create-dirs
	install -m ${MODE} init.d/sendmail   ${EXTDIR}/rc.d/init.d/

install-smartd: create-dirs
	install -m ${MODE} init.d/smartd    ${EXTDIR}/rc.d/init.d/

install-soprano: create-dirs
	install -m ${MODE} init.d/soprano    ${EXTDIR}/rc.d/init.d/

install-swat: create-dirs
	install -m ${MODE} init.d/swat      ${EXTDIR}/rc.d/init.d/

install-sshd: create-dirs
	install -m ${MODE} init.d/sshd       ${EXTDIR}/rc.d/init.d/

install-stunnel: create-dirs
	install -m ${MODE} init.d/stunnel    ${EXTDIR}/rc.d/init.d/

install-svn: create-dirs
	install -m ${MODE} init.d/svn        ${EXTDIR}/rc.d/init.d/

install-sysstat: create-dirs
	install -m ${MODE} init.d/sysstat    ${EXTDIR}/rc.d/init.d/

install-unbound: create-dirs
	install -m ${MODE} init.d/unbound       ${EXTDIR}/rc.d/init.d/

install-virtuoso: create-dirs
	install -m ${MODE} init.d/virtuoso   ${EXTDIR}/rc.d/init.d/

install-vsftpd: create-dirs
	install -m ${MODE} init.d/vsftpd     ${EXTDIR}/rc.d/init.d/

install-winbindd: create-dirs
	install -m ${MODE} init.d/winbindd      ${EXTDIR}/rc.d/init.d/

install-xinetd: create-dirs
	install -m ${MODE} init.d/xinetd     ${EXTDIR}/rc.d/init.d/

.PHONY: all create-dirs create-service-dir \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-ipx \
	install-service-pppoe \
	install-atd \
	install-accounts-daemon \
	install-acpid \
	install-alsa \
	install-avahi \
	install-httpd \
	install-php \
	install-bind \
	install-bluetooth \
	install-cups \
	install-saslauthd \
	install-wicd \
	install-dhcpd \
	install-dovecot \
	install-exim \
	install-fcron \
	install-firewalld \
	install-gdm \
	install-gpm \
	install-heimdal \
	install-iptables \
	install-krb5 \
	install-lprng \
	install-lxdm \
	install-mysql \
	install-netfs \
	install-networkmanager \
	install-nfs-client \
	install-nfs-server \
	install-ntpd \
	install-slapd \
	install-postfix \
	install-postgresql \
	install-proftpd \
	install-random \
	install-rsync \
	install-samba \
	install-sddm \
	install-sendmail \
	install-soprano \
	install-sshd \
	install-stunnel \
	install-svn \
	install-sysstat \
	install-vsftpd \
	install-unbound \
	install-virtuoso \
	install-winbindd \
	install-xinetd \
	uninstall-atd
