{ config, pkgs, user, sops-nix, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    age
	    sops
	    ssh-to-age
	    ssh-to-pgp
	;
    };

    programs.zsh = {
        sessionVariables = {
            GNUPGHOME = "/home/${user}/sync/pass/gpg";
	    NIX_SSHOPTS = "-i /home/${user}/sync/pass/ssh/thinkpad/thinkpad";
	    PASSWORD_STORE_DIR = "/home/${user}/sync/pass/pass";
	    SOPS_AGE_KEY_FILE  = "/home/${user}/sync/age/thinkpad";

            #GNUPGHOME = config.sops.secrets."environment/variables/gpg_home".path;
	    #NIX_SSHOPTS = config.sops.secrets."environment/variables/nix_sshopts".path;
	    #PASSWORD_STORE_DIR = config.sops.secrets."environment/variables/pass_dir".path;
	    #SOPS_AGE_KEY_FILE  = config.sops.secrets."environment/variables/sops_age_key".path;
	};
	shellAliases = {
	    ssh = "ssh -i ${config.home.homeDirectory}/sync/pass/ssh/thinkpad/thinkpad"; # SECRET
	};
    };

    # Order home-manager to restart sops-nix service.
    home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      /run/current-system/sw/bin/systemctl start --user sops-nix
    '';

    sops = {

        age.keyFile = "/home/${user}/sync/pass/age/thinkpad";
        defaultSopsFile = ./secrets.yaml;
	defaultSopsFormat = "yaml";

	# https://discourse.nixos.org/t/access-nixos-sops-secret-via-home-manager/38909/10
	defaultSymlinkPath = "/run/user/1001/secrets";
	defaultSecretsMountPoint = "/run/user/1001/secrets.d";
        
	#validateSopsFiles = false;
        #age = {
            # Automatically import host SSH keys as age keys.
	    #sshKeyPaths = [ "/home/${user}/sync/pass/ssh/thinkpad/thinkpad" ];

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
