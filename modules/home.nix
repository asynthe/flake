{config, ... }: {

  imports = [
    # Home
    ./home/app # Specific apps.
    ./home/dev # Developer tools.
    ./home/game # Videogames and emulators.
    ./home/media # Media apps (Video, audio, dj, ...) and configs.

    # System tools
    ./sys/home/pkgs.nix # System utilities and tools.

    # Network / Networking
    ./net/home/pkgs.nix # Networking and packages.

    # Cybersecurity
    ./sec/home/pkgs.nix # Cybersecurity apps and packages.

    # Audio
    ./snd/home/daw.nix # Audio and sound packages.
    ./snd/home/pkgs.nix # Audio apps and packages.

    # systemd Timers / Cron jobs
    #./timer # systemd timers and cron jobs.

    # Window Managers
    #./wm/hyprland # Hyprland configuration.
    #./wm/xmonad # xmonad configuration.
    #./wm/yabai # yabai configuration. (macOS)
  ];
}
