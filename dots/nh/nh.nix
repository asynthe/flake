{ config, lib, pkgs, ... }: {

    # Nix helper
    home.packages = builtins.attrValues { inherit (pkgs) nh; };
    programs.zsh.sessionVariables = lib.mkIf config.programs.zsh.enable {
        FLAKE = "${config.home.homeDirectory}/sync/dots";
    };
}
