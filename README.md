# qubes-remote-desktop

SystemD service for creating VNC server session in dom0 or any qube.

In dom0, install the package `qubes-remote-desktop`:

    # qubes-dom0-update qubes-remote-desktop

If the created user is `admin` then, start the service as

    systemctl start qubes-vncserver@admin

For any qube, install the package `qubes-remote-desktop` too with the distro-specific package tool and enable `qubes-vncserver` in qube `Settings`. Then, as the local user in any qube is `user` by default, in the qube, start the service as:

    systemctl start qubes-vncserver@user

In both cases, a VNC server session is created on `localhost:5901` that you can access with `qubes.ConnectTCP` RPC. For documentation on `qubes.ConnectTCP`, see https://www.qubes-os.org/doc/firewall/#opening-a-single-tcp-port-to-other-network-isolated-qube.