{config, ... }: {

  imports = [

    # Home Manager configuration and settings.
    ./home.nix 

    # Apps
    #./app/dots.nix
    ./app/emacs.nix
    #./app/nvim.nix
    #./app/neomutt.nix

    # Main
    ./main/3d.nix
    ./main/audio_daw.nix
    ./main/audio_pkgs.nix
    ./main/audio_tools.nix
    ./main/comms.nix
    ./main/coreutils_replace.nix
    ./main/dev_assembly.nix
    ./main/dev_latex.nix
    ./main/dev_python.nix
    ./main/dev_rust.nix
    ./main/dev_tools.nix
    ./main/fonts.nix
    ./main/gtk.nix
    ./main/image.nix
    ./main/jp.nix
    ./main/steam.nix
    ./main/xdg.nix

    # Pkgs
    ./pkgs/1_pkgs.nix
    ./pkgs/emulation.nix
    ./pkgs/games.nix
    ./pkgs/net.nix
    ./pkgs/sec.nix
    ./pkgs/shell.nix
    ./pkgs/system.nix
    ./pkgs/video.nix

    # systemd Timers
    #./systemd.nix

    # Window Managers
    #./wm/hyprland.nix
  ];
}
