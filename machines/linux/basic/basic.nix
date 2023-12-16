{ config, pkgs, ... }: {

  imports = [

    ../../../modules/nix/user # User environment and configuration.

    # Window Managers
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # Bootloader
    #../../../modules/nix/sys/grub.nix
    ../../../modules/nix/sys/systemd_boot.nix
    #../../../modules/nix/sys/secure_boot.nix
    #../../../modules/nix/sys/silent_boot.nix

    # System language
    #../../../modules/nix/sys/lang/en.nix # English
    #../../../modules/nix/sys/lang/jp.nix # Japanese (日本語)

    # Filesystems
    #../../../modules/nix/fs/fs.nix
    #../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

    # Audio
    ../../../modules/nix/audio/audio.nix
    #../../../modules/nix/audio/pipewire.nix
    #../../../modules/nix/audio/jack.nix

    # Network
    ../../../modules/nix/net/nm.nix # Network Manager

    # Extra configuration 
    #../../../modules/nix/sys/console.nix # Some tty configuration to make it better.
    #../../../modules/nix/sys/fs/win_mount.nix # Windows mount to `win` folder in home.
  ];

  # List of packages I want to have on a server.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      #pulseaudio # Needed by Pipewire. # Add to pipewire.nix?
      # CLI
      git # Git must be installed before flakes.
      wget
      curl
      lf
      neovim
      tmux
      alacritty kitty # Always good to have some extra terminals.

      # GUI
      librewolf
      ungoogled-chromium
      pavucontrol
      ;
  };

}
