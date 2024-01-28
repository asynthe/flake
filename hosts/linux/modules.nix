{ config, ... }: {

  imports = [

    # Secrets
    ../../secrets/secrets.nix

    # Test - temporary
    ../../modules/nix/sys/wheretoput.nix # Change later.
    # Test - make so it works on Home instead.
    ../../modules/test/nix/steam.nix
    ../../modules/test/nix/gaming.nix
    # Move to like home or smth
    #../../modules/nix/1_to_home/gaming.nix
    #../../modules/nix/1_to_home/mpd.nix
    #../../modules/nix/1_to_home/devops.nix

    # System - Locale 
    ../../modules/nix/sys/locale/en_jp.nix # English and Japanese
    #../../modules/nix/sys/locale/en.nix # English
    #../../modules/nix/sys/locale/jp.nix # Japanese (日本語)

    # System - Users
    ../../modules/nix/sys/env.nix # Environment configuration.
    ../../modules/nix/sys/fonts.nix # Fonts.
    ../../modules/nix/sys/ime.nix # Fcitx5 + mozc.
    ../../modules/nix/sys/user.nix # Main user module.

    # Audio
    ../../modules/nix/audio/bluetooth.nix
    #../../modules/nix/audio/jack.nix
    ../../modules/nix/audio/musnix.nix
    ../../modules/nix/audio/pipewire.nix

    # Bootloader
    #../../modules/nix/boot/grub.nix
    #../../modules/nix/boot/secure_boot.nix
    #../../modules/nix/boot/silent_boot.nix
    ../../modules/nix/boot/systemd_boot.nix

    # Daemon
    ../../modules/nix/daemon/android.nix
    ../../modules/nix/daemon/cups.nix
    #../../modules/nix/daemon/docker.nix
    #../../modules/nix/daemon/flatpak.nix
    #../../modules/nix/daemon/locate.nix
    #../../modules/nix/daemon/podman.nix
    #../../modules/nix/daemon/postgres.nix
    #../../modules/nix/daemon/syncthing.nix
    ../../modules/nix/daemon/wine.nix
    #../../modules/nix/daemon/xmr.nix

    # Drivers - Nvidia
    #../../modules/nix/driver/nvidia/nvidia.nix
    #../../modules/nix/driver/nvidia/offload.nix
    #../../modules/nix/driver/nvidia/reverse_sync.nix
    #../../modules/nix/driver/nvidia/sync.nix

    # Drivers
    ../../modules/nix/driver/fingerprint/t480.nix
    #../../modules/nix/driver/accelerated_video_playback.nix
    #../../modules/nix/driver/amd.nix
    #../../modules/nix/driver/displaylink.nix.
    ../../modules/nix/driver/intel.nix

    # Filesystems
    #../../modules/nix/fs/fs.nix
    #../../modules/nix/fs/f2fs.nix
    #../../modules/nix/fs/bcachefs.nix
    #../../modules/nix/fs/zfs.nix
    #../../modules/nix/fs/zfs_encryption.nix
    #../../modules/nix/extra/win_mount.nix # Automatically mount windows partition to `win` folder in home.
    # Software RAID with mdadm.
    #../../modules/nix/fs/raid/raid0.nix
    #../../modules/nix/fs/raid/raid1.nix

    # Network
    #../../modules/nix/net/anon/i2pd.nix
    #../../modules/nix/net/anon/proxychains.nix
    ../../modules/nix/net/anon/tor.nix
    #../../modules/nix/net/irc/irc.nix
    #../../modules/nix/net/irc/server.nix
    #../../modules/nix/net/remote/vnc.nix
    ../../modules/nix/net/ssh/mosh.nix
    ../../modules/nix/net/ssh/ssh.nix
    #../../modules/nix/net/dns.nix
    #../../modules/nix/net/elastic.nix
    ../../modules/nix/net/nm.nix # Network Manager.

    # Network - VPN
    ../../modules/nix/net/vpn/mullvad.nix
    #../../modules/nix/net/vpn/openvpn.nix
    ../../modules/nix/net/vpn/tailscale.nix
    #../../modules/nix/net/vpn/wireguard.nix
    #../../modules/nix/net/vpn/zero_tier_one.nix

    # Nix configuration
    ../../modules/nix/nix/settings.nix

    # Cybersecurity
    ../../modules/nix/sec/gpg.nix
    # Cybersecurity - Monitoring
    #../../modules/nix/sec/monitoring/grafana.nix
    #../../modules/nix/sec/monitoring/loki.nix
    #../../modules/nix/sec/monitoring/prometheus.nix

    # systemd
    ../../modules/nix/systemd/lid_switch.nix # Lid switch action for laptops.

    # Virtual Machines
    ../../modules/nix/vm/libvirt.nix # Virt-manager / libvirt.
    ../../modules/nix/vm/virtualbox.nix

    # Window Managers
    ../../modules/nix/wm/hyprland.nix
    ../../modules/nix/wm/xmonad.nix
    ../../modules/nix/wm/pkgs_wayland.nix
    ../../modules/nix/wm/pkgs_x11.nix
  ]; 
}
