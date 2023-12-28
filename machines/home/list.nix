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
    ../../modukes/home/audio/music_player.nix
    ../../modules/home/audio/pkgs.nix # Audio apps and packages.
    ../../modules/home/audio/tools.nix

    # Developer tools
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
    #../../modules/home/extra/steam.nix # Steam. (also managed by Nix)
    #../../modules/home/extra/emulation.nix # Emulators.
    #../../modules/home/extra/games.nix # Videogames.

    # Main
    ../../modules/home/main/coreutils.nix
    ../../modules/home/main/fonts.nix
    ../../modules/home/main/gtk.nix
    ../../modules/home/main/jp.nix # Memento video player
    ../../modules/home/main/xdg.nix
    ./pkgs/pkgs.nix
    ./pkgs/shell.nix
    ./pkgs/system.nix # System utilities and tools.

    # Media
    ../../modules/home/media/image.nix # Tools for inspection of images.
    ../../modules/home/media/video.nix # Tools for editing and creating videos.

    ../../modules/home/net/net.nix # Networking tools.
    ../../modules/home/sec/sec.nix # Cybersecurity tools.
    #./systemd.nix # systemd Timers (enable timers here or on default.nix?)

    # Tools
    ../../modules/tools/3d.nix # Blender and 3D viewers.

    # Window Managers
    #./wm/hyprland.nix # I really liked this, but i'm too impatient to be reloading Home Manager per every change.
  ];

}
