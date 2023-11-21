{ config, ... }: {

  # The Basic.nix should have the filesystems and everything.
  # This one should be used to enable more specific options like nvidia drivers
  # Audio, network, cybersecurity things, services
  # Although maybe it can also be used to prefer a file system over other(?)
  # Like if i choose this then mkForce disable the ext4 default.

  imports = [

    # Enable custom systemd services / timers.
    ../timers.nix

    # Window Managers
    ../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # User stuff (Move?)
    ../../../modules/nix/user

    # Drivers
    ../../../modules/nix/driver/intel.nix
    #../../../modules/nix/driver/amd.nix
    #../../../modules/nix/driver/nvidia/nvidia.nix
    #../../../modules/nix/driver/nvidia/offload.nix
    #../../../modules/nix/driver/nvidia/sync.nix
    #../driver/nvidia/reverse_sync.nix
    ../../../modules/nix/driver/accelerated_video_playback.nix # Video acceleration.
    #../../../modules/nix/driver/displaylink.nix # Display link drivers, requires manual setup.

    # Audio
    ../../../modules/nix/audio/audio.nix
    #../../../modules/nix/audio/pipewire.nix
    #../../../modules/nix/audio/jack.nix

    # Network
    ../../../modules/nix/net/dns.nix
    #../../../modules/nix/net/elastic.nix
    #../../../modules/nix/net/i2p.nix
    ../../../modules/nix/net/irc.nix
    #../../../modules/nix/net/irc_server.nix
    ../../../modules/nix/net/mosh.nix
    ../../../modules/nix/net/ssh.nix
    #../../../modules/nix/net/tailscale.nix
    ../../../modules/nix/net/vnc.nix
    ../../../modules/nix/net/vpn.nix
    #../../../modules/nix/net/zero_tier_one.nix

    # Cybersecurity
    ../../../modules/nix/sec/gpg.nix

    # Server
    ../../../modules/nix/server/syncthing.nix
    ../../../modules/nix/server/wine.nix # Wine configuration.
    #../../../modules/nix/server/xmr.nix # Monero.

    # Daemon
    #../../../modules/nix/daemon/locate.nix
    ../../../modules/nix/daemon/mpd.nix

    # Extra
    ../../../modules/nix/extra/gaming.nix
    ../../../modules/nix/extra/fcitx5_mozc.nix # Fcitx5 + mozc (IME)

    # Tools
    ../../../modules/nix/tools/android.nix # Android tools and packages.
    ../../../modules/nix/tools/devops.nix
    #../../../modules/nix/tools/libvirt.nix # Virt-manager / libvirt.
    ../../../modules/nix/tools/docker.nix
    ../../../modules/nix/tools/podman.nix
    ../../../modules/nix/tools/virtualbox.nix
  ]; 

}
