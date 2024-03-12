{ config, ... }: {

    imports = [

      ./modules/pkgs.nix

      # App
      ./modules/gpg.nix
      ./modules/ssh.nix

      # Dev
      ./modules/dev/python.nix

    ];
}
