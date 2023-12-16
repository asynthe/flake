{config, ... }: {

  imports = [

    # Home Manager configuration and settings.
    ./home.nix 

    # Temp file to test stuff
    ./pkgs/1_temp.nix

    # Apps
    #./app/dots.nix
    ./app/nvim
    ./app/emacs.nix
    #./app/nvim.nix
    #./app/neomutt.nix

    # Main
    ./main/3d.nix
    ./main/comms.nix
    ./main/coreutils.nix
    ./main/fonts.nix
    ./main/gtk.nix
    ./main/image.nix
    ./main/jp.nix
    ./main/steam.nix
    ./main/xdg.nix

    # Audio
    ./audio/daw.nix
    ./audio/music_player.nix
    ./audio/pkgs.nix
    ./audio/tools.nix

    # Dev
    ./dev/assembly.nix
    ./dev/latex.nix
    ./dev/lua.nix
    ./dev/python.nix
    ./dev/rust.nix
    ./dev/tools.nix

    # Pkgs
    ./pkgs/1_pkgs.nix
    #./pkgs/emulation.nix
    ./pkgs/games.nix
    ./pkgs/shell.nix
    ./pkgs/system.nix
    ./pkgs/video.nix

    ./net/net.nix # Networking tools.
    ./sec/sec.nix # Cybersecurity tools.

    # systemd Timers
    #./systemd.nix

    # Window Managers
    #./wm/hyprland.nix
  ];
}
