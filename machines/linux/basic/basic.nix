{ config, pkgs, ... }: {

  imports = [

    # System
    ../../../modules/nix/sys/boot.nix
    ../../../modules/nix/sys/network.nix

    # Bootloader
    #../../../modules/nix/sys/grub.nix
    ../../../modules/nix/sys/systemd_boot.nix
    ../../../modules/nix/sys/secure_boot.nix
    #../../../modules/nix/sys/silent_boot.nix

    # System language
    ../../../modules/nix/sys/lang/en.nix # English
    #../../../modules/nix/sys/lang/jp.nix # Japanese (日本語)

    # Filesystems
    ../../../modules/nix/fs/fs.nix # this is ZFS.nix lol / FIGURE OUT HOW TO DELETE THIS ONE.
    ../../../modules/nix/fs/f2fs.nix
    #../../../modules/nix/fs/bcachefs.nix
    #../../../modules/nix/fs/zfs.nix
    #../../../modules/nix/fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #../../../modules/nix/fs/raid/raid0.nix
    #../../../modules/nix/fs/raid/raid1.nix

    # Windows mount to `win` folder in home.
    #../../../modules/nix/sys/fs/win_mount.nix

    # Extra configuration 
    #../../../modules/nix/sys/silent_boot.nix # Silent boot
    #../../../modules/nix/sys/console.nix # Some tty configuration to make it better.
  ];

}
