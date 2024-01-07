{ config, pkgs, ... }: {

  imports = [

    # What to move to Home Manager
    #../../../modules/nix/daemon/mpd.nix
    ../../../modules/nix/extra/gaming.nix # Steam
    ../../../modules/nix/extra/fcitx5_mozc.nix # Fcitx5 + mozc (IME)
    ../../../modules/nix/extra/flatpak.nix # Flatpak
    #../../../modules/nix/tools/docker.nix # -> DEVOPS.NIX?
    #../../../modules/nix/tools/podman.nix # -> DEVOPS.NIX?
    #../../../modules/nix/tools/libvirt.nix # Virt-manager / libvirt.
    #../../../modules/nix/tools/virtualbox.nix
    #../../../modules/nix/tools/devops.nix
    #../../../modules/nix/tools/android.nix # Android tools and packages.
    #../../../modules/nix/daemon/locate.nix
    #../../../modules/nix/server/syncthing.nix

    # Secrets
    ../../../modules/nix/user/secrets.nix # Secrets (SSH, zerotier)

    # Users
    ../../../modules/nix/user/asynthe.nix # My customized user.
    #../../../modules/nix/user/basic.nix # Simple user for a server.

    # Bootloader
    #../../../modules/nix/boot/grub.nix
    ../../../modules/nix/boot/systemd_boot.nix
    #../../../modules/nix/boot/secure_boot.nix
    #../../../modules/nix/boot/silent_boot.nix

    # System language
    ../../../modules/nix/user/lang/en.nix # English
    #../../../modules/nix/user/lang/jp.nix # Japanese (日本語)

    # Filesystems
    #../../../modules/nix/fs/fs.nix
    #../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/win_mount.nix # Automatically mount windows partition to `win` folder in home.
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix
    # Software RAID with mdadm
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

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
    #../../../modules/nix/audio/mpd.nix # Enabled on Home Manager.
    ../../../modules/nix/audio/musnix.nix
    ../../../modules/nix/audio/pipewire.nix

    # Network
    #../../../modules/nix/net/dns.nix
    #../../../modules/nix/net/elastic.nix
    ../../../modules/nix/net/nm.nix # Network Manager configuration.
    #../../../modules/nix/net/i2p.nix
    ../../../modules/nix/net/ssh.nix
    #../../../modules/nix/net/mosh.nix
    #../../../modules/nix/net/irc.nix
    #../../../modules/nix/net/irc_server.nix
    #../../../modules/nix/net/tailscale.nix
    #../../../modules/nix/net/vnc.nix
    ../../../modules/nix/net/vpn.nix
    ../../../modules/nix/net/zero_tier_one.nix

    # Cybersecurity
    ../../../modules/nix/sec/gpg.nix

    # Server
    ../../../modules/nix/server/wine.nix # Wine configuration.
    #../../../modules/nix/server/xmr.nix # Monero.

    # Daemon
    ../../../modules/nix/extra/printing.nix # Printer
  ];

  # List of packages I want to have on any computer.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      alacritty kitty # Always good to have some extra terminals.
      wget curl
      git # Git must be installed before flakes.
      cachix
      tmux
      firefox
      pavucontrol

      # Gonna have to replace neovim with vim, and set up all the neovim shit on Home Manager
      vim
      ;
  };

}
