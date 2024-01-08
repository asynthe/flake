{ config, hostname, ... }: {

  networking.hostName = "${hostname}";

  imports = [

    # Nix configuration
    ../../../modules/nix/nix/settings.nix

    # Users
    #../../../modules/nix/user/basic.nix # Simple user for a server.
    ../../../modules/nix/user/asynthe.nix # My customized user.
    ../../../secrets/secrets.nix # Secrets (SSH, zerotier)

    # Bootloader
    #../../../modules/nix/boot/grub.nix
    ../../../modules/nix/boot/systemd_boot.nix
    #../../../modules/nix/boot/secure_boot.nix
    #../../../modules/nix/boot/silent_boot.nix

    # System language
    ../../../modules/nix/sys/locale/en_jp.nix # English and Japanese
    #../../../modules/nix/sys/locale/en.nix # English
    #../../../modules/nix/sys/locale/jp.nix # Japanese (日本語)

    # Filesystems
    #../../../modules/nix/fs/fs.nix
    #../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

    # Test
    ../../../modules/test/fingerprint.nix

    # Move to like home or smth
    #../../../modules/nix/daemon/mpd.nix
    #../../../modules/nix/server/syncthing.nix
    #../../../modules/nix/audio/mpd.nix # Enabled on Home Manager.

    # Window Managers
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # Packages
    ../../../modules/nix/pkgs/wayland.nix # Wayland packages.
    ../../../modules/nix/pkgs/x11.nix # X11 packages.

    # Drivers
    ../../../modules/nix/driver/intel.nix
    #../../../modules/nix/driver/amd.nix
    #../../../modules/nix/driver/nvidia/nvidia.nix
    #../../../modules/nix/driver/nvidia/offload.nix
    #../../../modules/nix/driver/nvidia/sync.nix
    #../driver/nvidia/reverse_sync.nix
    #../../../modules/nix/driver/accelerated_video_playback.nix # Video acceleration.
    #../../../modules/nix/driver/displaylink.nix # Display link drivers, requires manual setup.

    # Audio
    ../../../modules/nix/audio/audio.nix
    #../../../modules/nix/audio/jack.nix
    ../../../modules/nix/audio/musnix.nix
    ../../../modules/nix/audio/pipewire.nix

    # Network
    ../../../modules/nix/net/nm.nix # Network Manager configuration.
    #../../../modules/nix/net/dns.nix
    #../../../modules/nix/net/i2p.nix
    ../../../modules/nix/net/ssh.nix
    #../../../modules/nix/net/mosh.nix

    # Network - VPN
    ../../../modules/nix/net/vpn/mullvad.nix
    ../../../modules/nix/net/vpn/tailscale.nix
    #../../../modules/nix/net/vpn/zero_tier_one.nix

    # Cybersecurity
    ../../../modules/nix/sec/gpg.nix

    # Server
    ../../../modules/nix/server/wine.nix # Wine configuration.
    #../../../modules/nix/server/xmr.nix # Monero.

    # Daemon
    #../../../modules/nix/daemon/locate.nix
    ../../../modules/nix/daemon/printing.nix # Printer

    # Tools
    #../../../modules/nix/tools/android.nix # Android tools and packages.
    #../../../modules/nix/tools/devops.nix
    #../../../modules/nix/tools/docker.nix # -> DEVOPS.NIX?
    #../../../modules/nix/tools/podman.nix # -> DEVOPS.NIX?

    #../../../modules/nix/tools/libvirt.nix # Virt-manager / libvirt.
    #../../../modules/nix/tools/virtualbox.nix

    # Extra
    ../../../modules/nix/extra/gaming.nix # Steam
    ../../../modules/nix/extra/fcitx5_mozc.nix # Fcitx5 + mozc (IME)
    ../../../modules/nix/extra/flatpak.nix # Flatpak

    #../../../modules/nix/extra/win_mount.nix # Automatically mount windows partition to `win` folder in home.
    #../../../modules/nix/extra/irc.nix
    #../../../modules/nix/extra/irc_server.nix
    #../../../modules/nix/extra/elastic.nix
    #../../../modules/nix/extra/vnc.nix

  ]; 
}
