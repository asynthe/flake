{ config, inputs, pkgs, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = "missingno";
        homeDirectory = "/home/${config.home.username}";
        stateVersion = "23.11";
        packages = [ pkgs.nix ];
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
