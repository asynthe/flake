{config, ...}: {
  imports = [
  
    # Nix
    ./sys/settings.nix # Package manager configuration.

    # System
    ./sys/boot.nix
    ./sys/network.nix

    # Audio
    ./snd/sound.nix
    #./snd/pipewire.nix
    #./snd/jack.nix

    # Drivers
    #./drv/amd.nix
    ./drv/displaylink.nix
    ./drv/nvidia.nix

    # Filesystems
    ./fs/fs.nix #?
    #./fs/zfs.nix
    #./fs/zfs_encryption.nix
    #./fs/f2fs.nix
    #./fs/bcachefs.nix
    ./fs/win_mount.nix # Windows partition mounted on a folder in $HOME.

    # Network
    #./net/dns.nix
    #./net/i2p.nix
    ./net/mesh_network.nix # Tailscale, zero Tier One
    ./net/ssh.nix
    ./net/weechat.nix

    # Cybersecurity Tools
    ./sec
    ./sec/gpg.nix

    # Server
    ./srv/android.nix # Android tools and packages.
    ./srv/mpd.nix # MPD
    ./srv/vm.nix # VMs configuration.
    ./srv/wine.nix # Wine services and packages.

    # Extra
    ./extra/synthing.nix
    ./extra/gaming.nix
    ./extra/weechat.nix
  ];
}
