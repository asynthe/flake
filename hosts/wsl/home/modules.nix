{ config, ... }: {

    imports = [

        # Main
        ../../modules/home/pkgs.nix

        # Apps
        ../../modules/home/app/comms.nix # Discord, IRC, Signal, Telegram.
        ../../modules/home/app/emacs.nix
        ../../modules/home/app/jp.nix # Packages for japanese learning / immersion.
	../../modules/home/app/lf.nix

        # Audio
        ../../modules/home/audio/mpd.nix

        # Developer tools
        ../../modules/home/dev/ai.nix
        ../../modules/home/dev/latex.nix
        ../../modules/home/dev/python.nix

        # System
        ../../modules/home/sys/gtk.nix
    ];
}
