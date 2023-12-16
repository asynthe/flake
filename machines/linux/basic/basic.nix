{ config, pkgs, ... }: {

  imports = [

    ../../../modules/nix/user # User environment and configuration.
    # Window Managers
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # Bootloader
    #../../../modules/nix/boot/grub.nix
    ../../../modules/nix/boot/systemd_boot.nix
    #../../../modules/nix/boot/secure_boot.nix
    #../../../modules/nix/boot/silent_boot.nix

    # System language
    #../../../modules/nix/user/lang/en.nix # English
    #../../../modules/nix/user/lang/jp.nix # Japanese (日本語)

    # Filesystems
    #../../../modules/nix/fs/fs.nix
    #../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

  ];

  # List of packages I want to have on any computer.
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
