{ config, ... }: {

    imports = [

      ./modules/pkgs.nix
      ./modules/fonts.nix

      # App - Modules
      ./modules/app/shell

      # App - Single
      ./modules/app/android.nix # adb + waydroid.
      ./modules/app/git.nix
      ./modules/app/gpg.nix
      ./modules/app/lf.nix
      ./modules/app/ssh.nix

      # Dev
<<<<<<< HEAD
      ./modules/dev/ai.nix
      ./modules/dev/latex.nix
      ./modules/dev/python.nix
=======
      ./modules/dev/latex.nix
      #./modules/dev/python.nix # Managed by kali's apt for now.
>>>>>>> f69fbd7fd7ca7b1a65e11e9d3f4ee8830eba9568

      # System
      ./modules/sys/nix_settings.nix

    ];
}
