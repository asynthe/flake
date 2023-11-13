{ config, pkgs, ... }: {

  imports = [

    # Enable custom systemd services / timers.
    ./timers.nix
  
    # System
    ./sys/boot.nix
    #./sys/silent_boot.nix # Silent boot
    #./sys/console.nix
    ./sys/network.nix
  
    # Bootloader
    #./sys/grub.nix
    ./sys/systemd_boot.nix

    # Filesystems
    ./fs/fs.nix # this is ZFS.nix lol
    ./fs/f2fs.nix
    #./fs/bcachefs.nix
    #./fs/zfs.nix
    #./fs/zfs_encryption.nix

    #./fs/win_mount.nix # Windows partition mounted on a folder in $HOME.
    #./sys/mdadm/raid0.nix # RAID0/1 - mdadm

    # -------------------------------------------
    # Choose your Filesystem.

    #./fs/fs.nix # FIGURE OUT HOW TO DELETE THIS ONE.
    #./fs/f2fs.nix
    #./fs/bcachefs.nix
    #./fs/zfs.nix
    #./fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #./fs/raid/raid0.nix
    #./fs/raid/raid1.nix
    #...

    # Windows mount to home folder.
    #./fs/win_mount.nix
  ];
}
