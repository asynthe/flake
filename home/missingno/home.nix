{ config, pkgs, user, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = user;
        homeDirectory = "/home/${user}";
        packages = [ pkgs.nix ];
        sessionVariables = {
            NIX_PATH = "nixpkgs=${config.xdg.configHome}/nix/nixpkgs";
        };
    };
}
