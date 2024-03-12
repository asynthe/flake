{ config, ... }: {

    imports = [

      ./modules/pkgs.nix

      # App
      ./modules/app/git.nix
      ./modules/app/gpg.nix
      ./modules/app/lf.nix
      ./modules/app/ssh.nix

      # Dev
      ./modules/dev/python.nix

    ];
}
