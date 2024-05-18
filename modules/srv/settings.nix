{ user, ... }: {
    nix = {
	    # Nix settings
        settings = {
            auto-optimise-store = true;
            trusted-users = [ "${user}" ];
            experimental-features = ["nix-command" "flakes"];
            warn-dirty = false;
        };

        # Garbage collection
        gc = { 
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 4d";      
	    };
    };

    # Hanging at rebuild and wait-online service failing.
    # See nixpkgs#180175
    systemd.services.NetworkManager-wait-online.enable = false;
}
