{ config, pkgs, username, sops-nix, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    age
	    sops
	    ssh-to-age
	    ssh-to-pgp
	;
    };

    # Order home-manager to restart sops-nix service.
    home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      /run/current-system/sw/bin/systemctl start --user sops-nix
    '';

    sops = {

        age.keyFile = "/home/${username}/sync/pass/age/thinkpad";
        defaultSopsFile = ./secrets.yaml;
	defaultSopsFormat = "yaml";
        
	#validateSopsFiles = false;
        #age = {
            # Automatically import host SSH keys as age keys.
	    #sshKeyPaths = [ "/home/${username}/sync/pass/ssh/thinkpad/thinkpad" ];

	    # Use a age key expected to be in filesystem.
	    #keyFile = /home/ben/sync/pass/age/thinkpad;

	    # Generate a key if doesn't exist.
	    #generateKey = true;
        #};

        secrets = {
            "password/ben" = { };
            "password/server" = { };
	    "private_key/thinkpad" = { };
	    "private_key/server" = { };
	    "environment/variables/gpg_home" = { };
	    "environment/variables/nix_sshopts" = { };
	    "environment/variables/pass_dir" = { };
	    "environment/variables/sops_age_key" = { };
        };
    };
}
