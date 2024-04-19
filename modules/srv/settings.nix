{ config, ... }: {

    # MOVE
    # Locale
    i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
	"ja_JP.UTF-8/UTF-8"
    ];

    # Hanging at rebuild and wait-online service failing.
    # See nixpkgs#180175
    systemd.services.NetworkManager-wait-online.enable = false;

    nix = {
	# Nix settings
        settings = {
            auto-optimise-store = true;
            trusted-users = [ "server" ];
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
}
