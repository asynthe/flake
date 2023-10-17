{config, ...}: {
  imports = [
  
    # Nix
    ./nix/settings.nix # Package manager configuration.

    # System
    ./sys/boot.nix
    #./sys/silent_boot.nix # Silent boot
    #./sys/console.nix
    ./sys/network.nix
  
    # Bootloader - GRUB / systemd-boot
    #./sys/grub.nix
    ./sys/systemd_boot.nix

    # Audio
    ./snd/sound.nix
    #./snd/pipewire.nix
    #./snd/jack.nix

    # Drivers
    ./drv/accelerated_video_playback.nix
    #./drv/amd.nix
    #./drv/displaylink.nix
    ./drv/intel.nix
    ./drv/nvidia/nvidia.nix
    ./drv/nvidia/offload.nix
    #./drv/nvidia/sync.nix
    #./drv/nvidia/reverse_sync.nix

    # Filesystems
    ./fs/fs.nix # this is ZFS.nix lol
    #./fs/zfs.nix
    #./fs/zfs_encryption.nix
    ./fs/f2fs.nix
    #./fs/bcachefs.nix
    #./fs/win_mount.nix # Windows partition mounted on a folder in $HOME.

    #./sys/mdadm/raid0.nix # RAID0/1 - mdadm

    # Network
    #./net/dns.nix
    #./net/i2p.nix
    ./net/mesh_network.nix # Tailscale, zero Tier One
    ./net/ssh.nix

    # Cybersecurity Tools
    ./sec/gpg.nix

    # Server
    ./srv/android.nix # Android tools and packages.
    ./srv/mpd.nix # MPD
    ./srv/vm.nix # VMs configuration.
    ./srv/wine.nix # Wine services and packages.

    # Extra
    ./extra/syncthing.nix
    ./extra/gaming.nix
    ./extra/weechat.nix
  ];
}
