{ user, ... }: {

    programs.nh = {
        enable = true;
	    flake = "/home/${user}/sync/yuugen";
	    clean = {
            enable = true;
	        extraArgs = "--keep-since 4d --keep 3";
        };
    };

    nix = {
        settings = {
            auto-optimise-store = true;
            allowed-users = [ "${user}" ]; # Required for installing Home Manager?
            trusted-users = [ "${user}" ];
            experimental-features = [ "nix-command" "flakes" ];
            warn-dirty = false;
        };
    };

    # Hanging at rebuild and wait-online service failing.
    # See nixpkgs#180175
    systemd.services.NetworkManager-wait-online.enable = false;

    # The next is replaced by nh.
    # Garbage collection
    #nix.gc = {
        #automatic = true;
        #persistent = true; # Will do if it misses a gc because system was off.
        #dates = "weekly";
        #options = "--delete-older-than 4d";
    #};

    # Display changes after rebuild.
    # https://discourse.nixos.org/t/how-to-make-nixos-rebuild-output-more-informative/25549/8
    #system.activationScripts.diff = ''
      #if [[ -e /run/current-system ]]; then
        #echo "NixOS system closure diff:"
        #${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
      #fi
    #'';
}
