{ config, pkgs, user, sops-nix, ... }: {

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
	    sshKeyPaths = [ "/home/${user}/sync/pass/ssh/thinkpad/thinkpad" ];

	    # Use a age key expected to be in filesystem.
	    keyFile = /home/${user}/sync/pass/age/thinkpad;

	    # Generate a key if doesn't exist.
	    generateKey = true;
        };
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
