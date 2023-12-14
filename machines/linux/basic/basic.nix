{ config, pkgs, ... }: {

  imports = [

    ../../../modules/nix/default # User environment and configuration.

    # Window Manager
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # System
    ../../../modules/nix/sys/boot.nix
    ../../../modules/nix/sys/network_manager.nix

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

    # Extra configuration 
    #../../../modules/nix/sys/console.nix # Some tty configuration to make it better.
    #../../../modules/nix/sys/fs/win_mount.nix # Windows mount to `win` folder in home.
  ];

  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux"];
    supportedFilesystems = [
      "ext4"
      "vfat"
      #"fat" # Remove?
      #"exfat" # Remove?
    ];
  };

  # List of packages I want to have on a server.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      # CLI

      git # Git must be installed before flakes.
      wget
      curl
      lf
      neovim
      tmux
      pulseaudio # Needed by Pipewire.
      alacritty kitty # Always good to have some extra terminals.

      # GUI

      librewolf
      ungoogled-chromium
      pavucontrol
      ;
  };

}
