{ config, ... }: {

    programs.home-manager.enable = true;

    imports = [

        ./home.nix
        ./modules.nix

  ];
}
