{ config, ... }: {

  # The Basic.nix should have the filesystems and everything.
  # This one should be used to enable more specific options like nvidia drivers
  # Audio, network, cybersecurity things, services
  # Although maybe it can also be used to prefer a file system over other(?)
  # Like if i choose this then mkForce disable the ext4 default.

  imports = [

    # User stuff (Move?)
    ./user

    # Drivers
    ./driver/intel.nix
    #./driver/amd.nix
    ./driver/nvidia/nvidia.nix
    ./driver/nvidia/offload.nix
    #./driver/nvidia/sync.nix
    #./driver/nvidia/reverse_sync.nix
    ./driver/accelerated_video_playback.nix # Video acceleration.
    #./driver/displaylink.nix # Display link drivers, requires manual setup.

    # Audio
    ./audio/audio.nix
    #./audio/pipewire.nix
    #./audio/jack.nix

    # Network
    #./net/dns.nix
    #./net/elastic.nix
    #./net/i2p.nix
    ./net/irc.nix
    #./net/irc_server.nix
    ./net/mosh.nix
    ./net/openvpn.nix
    ./net/ssh.nix
    #./net/tailscale.nix
    ./net/vnc.nix
    #./net/zero_tier_one.nix

    # Cybersecurity
    ./sec/gpg.nix

    # Server
    ./server/syncthing.nix
    ./server/wine.nix # Wine configuration.
    #./server/xmr.nix # Monero.

    # Daemon
    #./daemon/locate.nix
    ./daemon/mpd.nix

    # Extra
    ./extra/gaming.nix

    # Tools
    ./tools/android.nix # Android tools and packages.
    ./tools/libvirt.nix # Virt-manager / libvirt.
    ./tools/docker.nix
    ./tools/podman.nix
    #./tools/virtualbox.nix
  ]; 

}
