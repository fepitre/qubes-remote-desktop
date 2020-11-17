TEST

# qubes-remote-desktop

SystemD service for creating VNC server session in dom0 or any qube.

When used in dom0, it adds an interface to control dom0 from outside. Technically, it weakens security, but it does so in a controlled way, through qrexec policy. Allowing this service makes dom0 isolated only as hard as VMs allowing to use this service.

## Remote dom0 desktop

In dom0, install the package `qubes-remote-desktop`:

    # qubes-dom0-update qubes-remote-desktop

If the created user is `admin` then, start the service as

    systemctl start qubes-vncserver@admin

## Remote qube desktop

For any qube, install the package `qubes-remote-desktop` too with the distro-specific package tool and enable `qubes-vncserver` in qube `Settings`. Then, as the local user in any qube is `user` by default, in the qube, start the service as:

    systemctl start qubes-vncserver@user

In both cases, a VNC server session is created on `localhost:5901` that you can access with `qubes.ConnectTCP` RPC. For documentation on `qubes.ConnectTCP`, see https://www.qubes-os.org/doc/firewall/#opening-a-single-tcp-port-to-other-network-isolated-qube.
