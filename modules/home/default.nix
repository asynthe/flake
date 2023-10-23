{config, ... }: {

  imports = [

    ./home.nix # Home Manager configuration and settings.
    ./user # FIX LATER PLS ORGANIzE

    # Home
    ./app # Specific apps.
    ./game # Videogames and emulators.
    ./media # Media apps (Video, audio, dj, ...) and configs.
    ./net/comms.nix

    ./ime/jp.nix # Memento video player

    # System tools
    ./sys/pkgs.nix # System utilities and tools.

    # Developer tools
    ./dev/assembly.nix # Assembly
    ./dev/tools.nix # Visual Studio Code
    ./dev/latex.nix # LaTeX
    ./dev/rust.nix # Python
    ./dev/python.nix # Rust

    # Network / Networking
    ./net/pkgs.nix # Networking and packages.

    # Cybersecurity
    ./sec/pkgs.nix # Cybersecurity apps and packages.

    # Audio
    ./audio/daw.nix # Audio and sound packages.
    ./audio/pkgs.nix # Audio apps and packages.
    ./audio/tools.nix

    # systemd Timers / Cron jobs
    #./timer/backup.nix # systemd timer.

    # Apps
    ./app/nvim.nix
    ./app/shell.nix
  ];
}
