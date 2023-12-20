{ config, ... }: {

  imports = [

    # Window Managers
    #../../../modules/nix/wm/hyprland.nix
    ../../../modules/nix/wm/xmonad.nix

    # Drivers
    ../../../modules/nix/driver/intel.nix
    #../../../modules/nix/driver/amd.nix
    #../../../modules/nix/driver/nvidia/nvidia.nix
    #../../../modules/nix/driver/nvidia/offload.nix
    #../../../modules/nix/driver/nvidia/sync.nix
    #../driver/nvidia/reverse_sync.nix
    #../../../modules/nix/driver/accelerated_video_playback.nix # Video acceleration.
    #../../../modules/nix/driver/displaylink.nix # Display link drivers, requires manual setup.

    # Audio
    ../../../modules/nix/audio/audio.nix
    #../../../modules/nix/audio/pipewire.nix
    #../../../modules/nix/audio/jack.nix

    # Network
    ../../../modules/nix/net/nm.nix # Network Manager configuration.
    #../../../modules/nix/net/dns.nix
    #../../../modules/nix/net/i2p.nix
    ../../../modules/nix/net/ssh.nix
    #../../../modules/nix/net/mosh.nix
    ../../../modules/nix/net/vpn.nix

    # Cybersecurity
    ../../../modules/nix/sec/gpg.nix

    # Server
    ../../../modules/nix/server/wine.nix # Wine configuration.
    #../../../modules/nix/server/xmr.nix # Monero.

    # Daemon
    #../../../modules/nix/daemon/locate.nix
    ../../../modules/nix/daemon/mpd.nix
    #../../../modules/nix/server/syncthing.nix

    # Tools
    #../../../modules/nix/tools/android.nix # Android tools and packages.
    #../../../modules/nix/tools/devops.nix
    #../../../modules/nix/tools/docker.nix # -> DEVOPS.NIX?
    #../../../modules/nix/tools/podman.nix # -> DEVOPS.NIX?

    #../../../modules/nix/tools/libvirt.nix # Virt-manager / libvirt.
    #../../../modules/nix/tools/virtualbox.nix

    # Extra
    ../../../modules/nix/extra/gaming.nix # Steam
    ../../../modules/nix/extra/fcitx5_mozc.nix # Fcitx5 + mozc (IME)
    ../../../modules/nix/extra/flatpak.nix # Flatpak
    #../../../modules/nix/extra/win_mount.nix # Automatically mount windows partition to `win` folder in home.
    #../../../modules/nix/extra/irc.nix
    #../../../modules/nix/extra/irc_server.nix
    #../../../modules/nix/extra/elastic.nix
    #../../../modules/nix/extra/zero_tier_one.nix
    #../../../modules/nix/extra/tailscale.nix
    #../../../modules/nix/extra/vnc.nix

  ]; 

}
