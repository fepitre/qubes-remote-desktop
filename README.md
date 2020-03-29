# qubes-remote-desktop

SystemD services for creating VNC server session in dom0 or any qube.

When used in dom0, it adds an interface to control dom0 from outside. Technically, it weakens security, but it does so in a controlled way, through qrexec policy. Allowing this service makes dom0 isolated only as hard as VMs allowing to use this service.

Two services are provided: `qubes-x0vncserver` and `qubes-vncserver`. The first will start a VNC server bounded to current `DISPLAY=:0` where as the second, create a desktop session on `DISPLAY=:1`.

This package intends to ease the VNC configuration in QubesOS configuration. A password is required only for dom0 side.

The service `qubes-x0vncserver` will be superseeded by remote GuiVM in QubesOS R4.1.

## Remote dom0 desktop

In dom0, install the package `qubes-remote-desktop`:

    # qubes-dom0-update qubes-remote-desktop

If the created user is `admin` then, create a VNC password:

    [admin@dom0 ~]$ vncpassword

enable the service at Qubes level:

    [admin@dom0 ~]$ qvm-service --enable dom0 qubes-x0vncserver

and finally, start the service:

    [admin@dom0 ~]$ systemctl start qubes-x0vncserver@admin

A VNC server session is created on `localhost:5900`.

## Remote qube desktop

For any qube, install the package `qubes-remote-desktop` with the distro-specific package tool and enable `qubes-vncserver` in qube `Settings`. Then, as the local user in any qube is `user` by default, in the qube, start the service as:

    [user@appvm ~]$ systemctl start qubes-vncserver@user

A VNC server session is created on `localhost:5901`.

In both cases, you can access the sessions with `qubes.ConnectTCP` RPC. For documentation on `qubes.ConnectTCP`, see https://www.qubes-os.org/doc/firewall/#opening-a-single-tcp-port-to-other-network-isolated-qube.