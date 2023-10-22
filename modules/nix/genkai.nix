{ config, ... }: {

  # The Basic.nix should have the filesystems and everything.
  # This one should be used to enable more specific options like nvidia drivers
  # Audio, network, cybersecurity things, services
  # Although maybe it can also be used to prefer a file system over other(?)
  # Like if i choose this then mkForce disable the ext4 default.

  imports = [

    # Drivers
    ./driver/accelerated_video_playback.nix
    #./driver/amd.nix
    #./driver/displaylink.nix
    ./driver/intel.nix
    ./driver/nvidia/nvidia.nix
    ./driver/nvidia/offload.nix
    #./driver/nvidia/sync.nix
    #./driver/nvidia/reverse_sync.nix

    # Audio
    ./sound/sound.nix
    #./sound/pipewire.nix
    #./sound/jack.nix

    # Network
    #./net/dns.nix
    #./net/i2p.nix
    ./net/mesh_network.nix # Tailscale, zero Tier One
    ./net/ssh.nix
    ./net/mosh.nix
    ./net/openvpn.nix
    ./net/irc/irc.nix
    #./net/irc/irc_server.nix
    ./net/rdp.nix

    # Cybersecurity
    ./sec/gpg.nix

    # Server
    ./srv/android.nix # Android tools and packages.
    ./srv/mpd.nix # MPD
    ./srv/vm.nix # VMs configuration.
    ./srv/wine.nix # Wine services and packages.

    # Extra
    ./extra/syncthing.nix
    ./extra/gaming.nix#
  ]; 

}
