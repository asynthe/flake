{ config, pkgs, username, ... }: {

    nix = {
        settings = {
          auto-optimise-store = true;
          allowed-users = [ "${username}" ]; # Required for installing Home Manager?
          trusted-users = [ "${username}" ];
          experimental-features = [ "nix-command" "flakes" ];
          warn-dirty = false;
        };

        # Garbage collection
        gc = {
            automatic = true;
            persistent = true; # Will do if it misses a gc because system was off.
            dates = "weekly";
            options = "--delete-older-than 4d";
        };
    };

    # gvfs needed for almost all file explorers
    services.gvfs.enable = true;

    # Hanging at rebuild and wait-online service failing.
    # See nixpkgs#180175
    systemd.services.NetworkManager-wait-online.enable = false;

    # Display changes after rebuild.
    # https://discourse.nixos.org/t/how-to-make-nixos-rebuild-output-more-informative/25549/8
    system.activationScripts.diff = ''
      if [[ -e /run/current-system ]]; then
        echo "NixOS system closure diff:"
        ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
      fi
    '';
}
