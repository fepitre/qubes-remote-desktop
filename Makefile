all:
	@true

install-vm:
	install -Dm 644 qubes-vnc-xstartup $(DESTDIR)/usr/lib/qubes/qubes-vnc-xstartup
	install -Dm 640 qubes-vncserver@-vm.service $(DESTDIR)/lib/systemd/system/qubes-vncserver@.service
	install -Dm 640 30_qubes.conf $(DESTDIR)/etc/systemd/system/qubes-vncserver@.service.d/30_qubes.conf

install-dom0:
	install -Dm 640 qubes-vncserver@-dom0.service $(DESTDIR)/lib/systemd/system/qubes-vncserver@.service
