{
    imports = [
        # Test - make so it works on Home instead.
        #../../modules/test/nix/fluent-bit.nix

        # Daemon
        #../../modules/nix/daemon/android.nix
        #../../modules/nix/daemon/cups.nix
        #../../modules/nix/daemon/docker.nix
        #../../modules/nix/daemon/flatpak.nix
        #../../modules/nix/daemon/locate.nix
        #../../modules/nix/daemon/podman.nix
        #../../modules/nix/daemon/postgres.nix
        #../../modules/nix/daemon/syncthing.nix
        #../../modules/nix/daemon/wine.nix
        #../../modules/nix/daemon/xmr.nix

        # Drivers - Nvidia
        #../../modules/nix/driver/nvidia/nvidia.nix
        #../../modules/nix/driver/nvidia/offload.nix
        #../../modules/nix/driver/nvidia/reverse_sync.nix
        #../../modules/nix/driver/nvidia/sync.nix

        # Drivers
        #../../modules/nix/driver/fingerprint/t480.nix
        #../../modules/nix/driver/accelerated_video_playback.nix
        #../../modules/nix/driver/amd.nix
        #../../modules/nix/driver/displaylink.nix.
        #../../modules/nix/driver/intel.nix

        # Network
        #../../modules/nix/net/anon/i2pd.nix
        #../../modules/nix/net/anon/proxychains.nix
        #../../modules/nix/net/anon/tor.nix
        #../../modules/nix/net/irc/irc.nix
        #../../modules/nix/net/irc/server.nix
        #../../modules/nix/net/remote/vnc.nix

        #../../modules/nix/net/dns.nix
        #../../modules/nix/net/elastic.nix
        #../../modules/nix/net/nm.nix # Network Manager.

        # Network - VPN
        #../../modules/nix/net/vpn/openvpn.nix
        #../../modules/nix/net/vpn/tailscale.nix
        #../../modules/nix/net/vpn/wireguard.nix
        #../../modules/nix/net/vpn/zero_tier_one.nix

        # Nix configuraion
        #../../modules/nix/nix/settings.nix
        #../../modules/nix/nix/nixops.nix
        #../../modules/nix/nix/cachix.nix

        # Cybersecurity
        #../../modules/nix/sec/gpg.nix

        # Monitoring
        #../../modules/nix/sec/monitoring/grafana.nix
        #../../modules/nix/sec/monitoring/loki.nix
        #../../modules/nix/sec/monitoring/prometheus.nix

        # systemd

        # Virtual Machines
        #../../modules/nix/vm/virtualbox.nix
	#../../modules/nix/vm/vmware.nix

        # Window Managers
        #../../modules/nix/wm/hyprland.nix
        #../../modules/nix/wm/pkgs_wayland.nix
        #../../modules/nix/wm/xmonad.nix
        #../../modules/nix/wm/pkgs_x11.nix
    ];
}
