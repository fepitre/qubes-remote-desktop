all:
	@true

install:
	install -Dm 640 qubes-vncserver@.service $(DESTDIR)/lib/systemd/system/qubes-vncserver@.service
	install -Dm 640 30_qubes.conf.in $(DESTDIR)/etc/systemd/system/qubes-vncserver@.service.d/30_qubes.conf
	sed -i 's/@VNC@/vncserver/g' $(DESTDIR)/lib/systemd/system/qubes-vncserver@.service $(DESTDIR)/etc/systemd/system/qubes-vncserver@.service.d/30_qubes.conf

	install -Dm 640 qubes-x0vncserver@.service $(DESTDIR)/lib/systemd/system/qubes-x0vncserver@.service
	install -Dm 640 30_qubes.conf.in $(DESTDIR)/etc/systemd/system/qubes-x0vncserver@.service.d/30_qubes.conf
	sed -i 's/@VNC@/x0vncserver/g' $(DESTDIR)/lib/systemd/system/qubes-x0vncserver@.service $(DESTDIR)/etc/systemd/system/qubes-x0vncserver@.service.d/30_qubes.conf

	install -Dm 644 qubes-vnc-xstartup $(DESTDIR)/usr/lib/qubes/qubes-vnc-xstartup
