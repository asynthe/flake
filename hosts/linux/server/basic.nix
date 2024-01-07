{ config, pkgs, ... }: {

  imports = [

    # Users
    ../../../modules/nix/user/asynthe.nix # My customized user.
    ../../../modules/nix/user/secrets.nix # Secrets (SSH, zerotier)
    #../../../modules/nix/user/basic.nix # Simple user for a server.

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

      neovim
      libgccjit
      binutils
      ;
  };

}