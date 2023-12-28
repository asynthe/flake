{ config, ... }: {

  imports = [

    ../../modules/home/test.nix # Temp file to test stuff

    # Apps
    #../../modules/home/app/dots.nix
    ../../modules/home/app/nvim
    ../../modules/home/app/emacs.nix
    #../../modules/home/app/nvim.nix
    #../../modules/home/app/neomutt.nix

    # Audio
    ../../modules/home/audio/daw.nix # Audio and sound packages.
    ../../modules/home/audio/mpd.nix
    ../../modules/home/audio/music_player.nix
    ../../modules/home/audio/pkgs.nix # Audio apps and packages.
    ../../modules/home/audio/tools.nix

    # Developer tools
    #../../modules/home/dev/3d.nix # 3D viewers and tools.
    #../../modules/home/dev/assembly.nix
    ../../modules/home/dev/devops.nix
    #../../modules/home/dev/latex.nix
    #../../modules/home/dev/lua.nix
    ../../modules/home/dev/python.nix
    ../../modules/home/dev/rust.nix
    #../../modules/home/dev/tools.nix
    #../../modules/home/dev/gamedev.nix # Blender, ...

    # Extra
    ../../modules/home/main/comms.nix # Discord, IRC, Signal, Telegram.
    #../../modules/home/extra/emulation.nix # Emulators.
    #../../modules/home/extra/game.nix # Videogames.
    #../../modules/home/extra/steam.nix # Steam. (also managed by Nix)

    # Main
    ../../modules/home/main/coreutils.nix
    ../../modules/home/main/fonts.nix
    ../../modules/home/main/gtk.nix
    ../../modules/home/main/jp.nix # Memento video player
    ../../modules/home/main/pkgs.nix
    ../../modules/home/main/shell.nix
    ../../modules/home/main/system.nix # System utilities and tools.
    ../../modules/home/main/xdg.nix

    # Media
    ../../modules/home/media/image.nix # Tools for inspection of images.
    ../../modules/home/media/video.nix # Tools for editing and creating videos.

    ../../modules/home/net/net.nix # Networking tools.
    ../../modules/home/sec/sec.nix # Cybersecurity tools.
    #../../modules/home/timer/systemd.nix # systemd Timers (enable timers here or on default.nix?)

    # Window Managers
    #./wm/hyprland.nix # I really liked this, but i'm too impatient to be reloading Home Manager per every change.
  ];

}
