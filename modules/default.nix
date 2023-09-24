{config, ...}: {
  imports = [

    # System
    ./sys/boot.nix
    ./sys/fs.nix
    ./sys/network.nix
    ./sys/nix_settings.nix

    # Drivers
    #./drv/amd.nix
    ./drv/nvidia.nix
    ./displaylink.nix

    # Filesystems
    ./fs/main.nix #?
    ./fs/zfs.nix
    #./fs/zfs_encryption.nix
    ./fs/f2fs
    ./fs/bcachefs.nix
    ./fs/win_mount.nix

    ./net
    ./sec
    ./snd
    ./srv

    # Extra
    ./extra
  ];
}
