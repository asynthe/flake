{ config, ... }: {

    imports = [

      ./modules/pkgs.nix
      ./modules/fonts.nix

      # Apps
      ./modules/app/android.nix # adb + waydroid.
      #./modules/app/bash.nix # bash shell.
      ./modules/app/git.nix
      ./modules/app/gpg.nix
      ./modules/app/lf.nix
      ./modules/app/ssh.nix
      ./modules/app/starship.nix
      ./modules/app/tmux.nix
      ./modules/app/zathura.nix
      ./modules/app/zsh.nix

      # Dev
      ./modules/dev/ai.nix
      ./modules/dev/latex.nix
      ./modules/dev/python.nix
      ./modules/dev/latex.nix
      #./modules/dev/python.nix # Managed by kali's apt for now.

      # System
      ./modules/sys/nix_settings.nix

    ];
}
