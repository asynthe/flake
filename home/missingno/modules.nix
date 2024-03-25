{ config, ... }: {

    imports = [
        ../modules/home/pkgs.nix
        ../modules/home/fonts.nix

        # Apps
        ../modules/home/app/android.nix # adb + waydroid.
        #../modules/home/app/bash.nix # bash shell.
        ../modules/home/app/git.nix
        ../modules/home/app/gpg.nix
        ../modules/home/app/lf.nix
        ../modules/home/app/ssh.nix
        ../modules/home/app/starship.nix
        ../modules/home/app/tmux.nix
        ../modules/home/app/zathura.nix
        ../modules/home/app/zsh.nix

        # Dev
        ../modules/home/dev/ai.nix
        #../modules/home/dev/assembly.nix
        ../modules/home/dev/python.nix
        ../modules/home/dev/latex.nix
        #../modules/home/dev/python.nix # Managed by kali's apt for now.

        # System
        ../modules/home/sys/nix_settings.nix
    ];
}
