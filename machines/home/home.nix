{config, ... }: {

  imports = [

    # Home
    ../../modules/home/app # Specific apps.
    ../../modules/home/game # Videogames and emulators.
    ../../modules/home/media # Media apps (Video, audio, dj, ...) and configs.
    ../../modules/home/comms.nix
    ../../modules/home/jp.nix # Memento video player

    # System tools
    ../../modules/sys/home/pkgs.nix # System utilities and tools.

    # Developer tools
    ../../modules/home/dev/assembly.nix # Assembly
    ../../modules/home/dev/tools.nix # Visual Studio Code
    ../../modules/home/dev/latex.nix # LaTeX
    ../../modules/home/dev/rust.nix # Python
    ../../modules/home/dev/python.nix # Rust

    # Network / Networking
    ../../modules/net/home/pkgs.nix # Networking and packages.

    # Cybersecurity
    ../../modules/sec/home/pkgs.nix # Cybersecurity apps and packages.

    # Audio
    ../../modules/home/audio/daw.nix # Audio and sound packages.
    ../../modules/home/audio/mpd.nix
    ../../modules/home/audio/pkgs.nix # Audio apps and packages.
    ../../modules/home/audio/tools.nix

  ];

}
