{ config, pkgs, username, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = "missingno";
        homeDirectory = "/home/${username}";
        packages = [ pkgs.nix ]; # ?
        sessionVariables = {
            NIX_PATH = "nixpkgs=${config.xdg.configHome}/nix/nixpkgs";
        };
    };
}
