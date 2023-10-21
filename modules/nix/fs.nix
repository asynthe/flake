{ config, ... }: {

  imports = [
    # Choose your Filesystem.
    ./fs/fs.nix # FIGURE OUT HOW TO DELETE THIS ONE.
    ./fs/f2fs.nix
    ./fs/bcachefs.nix
    ./fs/zfs.nix
    ./fs/zfs_encryption.nix

    # Software RAID with mdadm.
    #./fs/raid/raid0.nix
    #./fs/raid/raid1.nix
    #...

    # Windows mount to home folder.
    #./fs/win_mount.nix
  ];

}
