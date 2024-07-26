{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.system.nix.settings;
in {
    options.meta.system.nix.settings = mkOption {
        type = str;
        default = "server";
        description = "Nix daemon configuration.";
    };

    config = mkIf (cfg != null) {

        # Hanging at rebuild and wait-online service failing.
        # See nixpkgs#180175
        systemd.services.NetworkManager-wait-online.enable = false;

        # Nix Settings
        nix.settings = {
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
            allowed-users = [ "${config.meta.system.user}" ]; # Required for Home Manager
            trusted-users = [ "${config.meta.system.user}" ];
            warn-dirty = false;
        };

        # nh if using laptop configuration
        programs.nh = mkIf (cfg == "laptop") {
            enable = true;
	        flake = "/home/${config.meta.system.user}/sync/yuugen";
	        clean = {
                enable = true;
	            extraArgs = "--keep-since 4d --keep 3";
            };
        };

        # Garbage collection
        nix.gc = mkIf (cfg != "laptop") { 
            persistent = true; # Persist if gc is missed.
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 4d";      
	    };

        # Display changes after rebuild.
        # https://discourse.nixos.org/t/how-to-make-nixos-rebuild-output-more-informative/25549/8
        system.activationScripts.diff = mkIf (cfg != "laptop") ''
          if [[ -e /run/current-system ]]; then
            echo "NixOS system closure diff:"
          ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
          fi
        '';
    };
}
