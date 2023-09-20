{ config, ... }: {

  imports = [

    ./app # Specific apps.
    ./dev # Developer tools.
    ./game # Videogames and emulators.
    ./media # Media apps (Video, audio, dj, ...) and configs.
    ./net # Networking apps and configs.
    ./sec # Cybersecurity apps and configs.
    ./snd # Audio and sound packages.
    #./timer # systemd timers and cron jobs.
    
    # Window Managers
    #./wm/hyprland # Hyprland configuration.
    #./wm/xmonad # xmonad configuration.
    #./wm/yabai # yabai configuration. (macOS)

  ];
}
