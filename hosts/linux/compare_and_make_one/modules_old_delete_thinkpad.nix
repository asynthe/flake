{ config, hostname, ... }: {


  # System setup
  #networking.hostName = "thinknya"; # Set up as "${hostname}" if you've set a custom hostname.
  #networkconfig.thinkpad.enable = true;

  imports = [

    # Delete
    # Networking - Test
    #../../../modules/test/nix/nm.nix # Disable other networkmanager

    # Test
    ../../../modules/test/nix/fingerprint/t480_fingerprint.nix
    ../../../modules/test/nix/lid_switch.nix
    # Test - make so it works on Home instead.
    ../../../modules/test/nix/steam.nix
    ../../../modules/test/nix/gaming.nix
    # Move to like home or smth
    #../../../modules/nix/1_to_home/gaming.nix
    #../../../modules/nix/1_to_home/mpd.nix
    #../../../modules/nix/1_to_home/devops.nix

    # System - Locale 
    ../../../modules/nix/sys/locale/en_jp.nix # English and Japanese
    #../../../modules/nix/sys/locale/en.nix # English
    #../../../modules/nix/sys/locale/jp.nix # Japanese (日本語)

    # System - Users
    #../../../modules/nix/sys/user/basic.nix # Simple user for a server.
    ../../../modules/nix/sys/user/asynthe.nix # My customized user.
    ../../../modules/nix/sys/user/ime.nix # Fcitx5 + mozc.

    # Audio
    ../../../modules/nix/audio/bluetooth.nix
    #../../../modules/nix/audio/jack.nix
    ../../../modules/nix/audio/musnix.nix
    ../../../modules/nix/audio/pipewire.nix

    # Bootloader
    #../../../modules/nix/boot/grub.nix
    #../../../modules/nix/boot/secure_boot.nix
    #../../../modules/nix/boot/silent_boot.nix
    ../../../modules/nix/boot/systemd_boot.nix

    # Daemon
    #../../../modules/nix/daemon/android.nix
    #../../../modules/nix/daemon/cups.nix
    #../../../modules/nix/daemon/docker.nix
    #../../../modules/nix/daemon/flatpak.nix
    #../../../modules/nix/daemon/locate.nix
    #../../../modules/nix/daemon/podman.nix
    #../../../modules/nix/daemon/postgres.nix
    #../../../modules/nix/daemon/syncthing.nix
    ../../../modules/nix/daemon/wine.nix
    #../../../modules/nix/daemon/xmr.nix

    # Drivers - Nvidia
    #../../../modules/nix/driver/nvidia/nvidia.nix
    #../../../modules/nix/driver/nvidia/offload.nix
    #../../../modules/nix/driver/nvidia/reverse_sync.nix
    #../../../modules/nix/driver/nvidia/sync.nix

    # Drivers
    #../../../modules/nix/driver/accelerated_video_playback.nix
    #../../../modules/nix/driver/amd.nix
    #../../../modules/nix/driver/displaylink.nix.
    ../../../modules/nix/driver/intel.nix

    # Filesystems
    #../../../modules/nix/fs/fs.nix
    #../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix
    #../../../modules/nix/extra/win_mount.nix # Automatically mount windows partition to `win` folder in home.
    # Software RAID with mdadm.
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

    # Network
    #../../../modules/nix/net/anon/i2p.nix
    #../../../modules/nix/net/anon/proxychains.nix
    #../../../modules/nix/net/anon/tor.nix
    #../../../modules/nix/net/irc/irc.nix
    #../../../modules/nix/net/irc/server.nix
    #../../../modules/nix/net/remote/vnc.nix
    #../../../modules/nix/net/ssh/mosh.nix
    ../../../modules/nix/net/ssh/ssh.nix
    #../../../modules/nix/net/dns.nix
    #../../../modules/nix/net/elastic.nix
    ../../../modules/nix/net/nm.nix # Network Manager.

    # Network - VPN
    ../../../modules/nix/net/vpn/mullvad.nix
    #../../../modules/nix/net/vpn/openvpn.nix
    ../../../modules/nix/net/vpn/tailscale.nix
    #../../../modules/nix/net/vpn/wireguard.nix
    #../../../modules/nix/net/vpn/zero_tier_one.nix

    # Nix configuration
    ../../../modules/nix/nix/settings.nix
    ../../../secrets/secrets.nix # Secrets (SSH, zerotier)

    # Cybersecurity
    ../../../modules/nix/sec/gpg.nix

    # Cybersecurity - Monitoring
    #../../../modules/nix/sec/monitoring/grafana.nix
    #../../../modules/nix/sec/monitoring/loki.nix
    #../../../modules/nix/sec/monitoring/prometheus.nix

    # Virtual Machines
    ../../../modules/nix/vm/libvirt.nix # Virt-manager / libvirt.
    #../../../modules/nix/tools/virtualbox.nix

    # Window Managers
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix
    ../../../modules/nix/wm/pkgs_wayland.nix
    ../../../modules/nix/wm/pkgs_x11.nix
  ]; 
}
