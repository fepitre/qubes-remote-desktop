all:
	@true

install-common:
	install -Dm 644 qubes-vnc-xstartup $(DESTDIR)/usr/lib/qubes/qubes-vnc-xstartup
	install -Dm 640 qubes-vncserver@.service $(DESTDIR)/lib/systemd/system/qubes-vncserver@.service

install-vm: install-common
	install -Dm 640 30_qubes.conf $(DESTDIR)/etc/systemd/system/qubes-vncserver@.service.d/30_qubes.conf
