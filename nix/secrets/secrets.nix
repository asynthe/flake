{ sops-nix, pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	        age
	        sops
	        ssh-to-age
	        ssh-to-pgp
	    ;
    };

    sops = {
        defaultSopsFile = ./secrets.yaml;
	    defaultSopsFormat = "yaml";
        validateSopsFiles = false;
        age = {
            # Automatically import host SSH keys as age keys.
	        sshKeyPaths = [ "/home/ben/sync/pass/ssh/thinkpad/thinkpad" ];

	        # Use a age key expected to be in filesystem.
	        keyFile = /home/ben/sync/pass/age/thinkpad;

	        # Generate a key if doesn't exist.
	        generateKey = true;
        };
        secrets = {
	        "environment/variables/gpg_home" = { };
	        "environment/variables/nix_sshopts" = { };
	        "environment/variables/pass_dir" = { };
	        "environment/variables/sops_age_key" = { };
	        "ssh/private/server" = { };
	        "ssh/private/thinkpad" = { };
            "password/thinkpad" = { };
        };
    };
}
