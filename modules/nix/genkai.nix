{ config, ... }: {

  # The Basic.nix should have the filesystems and everything.
  # This one should be used to enable more specific options like nvidia drivers
  # Audio, network, cybersecurity things, services
  # Although maybe it can also be used to prefer a file system over other(?)
  # Like if i choose this then mkForce disable the ext4 default.

  imports = [

    # Drivers
    ./drv/accelerated_video_playback.nix
    #./drv/amd.nix
    #./drv/displaylink.nix
    ./drv/intel.nix
    ./drv/nvidia/nvidia.nix
    ./drv/nvidia/offload.nix
    #./drv/nvidia/sync.nix
    #./drv/nvidia/reverse_sync.nix

    # Audio
    ./snd/sound.nix
    #./snd/pipewire.nix
    #./snd/jack.nix

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
