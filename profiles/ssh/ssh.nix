{

    # OPTIONS
    # - server
    # - thinkpad

    imports = [ ./banner_server.nix ];

    # SERVER
    services.openssh = {
        enable = true;
	    allowSFTP = true;
        settings = {
            #PermitRootLogin = "no"; # Messes up with nixos-anywhere.
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            # MOVE IMPORT HERE OR BANNER lib.mkReadFile
        };
    };
}
