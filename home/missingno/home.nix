{ config, inputs, pkgs, username, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = "missingno";
        homeDirectory = "/home/${username}";
        packages = [ pkgs.nix ]; # ?
        sessionVariables = {
            NIX_PATH = "nixpkgs=${config.xdg.configHome}/nix/nixpkgs";
        };
    };

    #xdg.configFile = {
        #"home-manager-wsl/flake".source = ./.;
        #"nix/nixpkgs".source = inputs.nixpkgs;
    #};

    nix = {
        package = pkgs.nix;
        settings = {
            extra-experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
    };
}
