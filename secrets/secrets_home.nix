{ config, pkgs, username, sops-nix, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    age
	    sops
	    ssh-to-age
	    ssh-to-pgp
	;
    };

    programs.zsh = {
        #sessionVariables = {
            #GNUPGHOME = config.sops.secrets."environment/variables/gpg_home".path; # SECRET
	    #NIX_SSHOPTS = config.sops.secrets."environment/variables/nix_sshopts".path; # SECRET
	    #PASSWORD_STORE_DIR = config.sops.secrets."environment/variables/pass_dir".path; # SECRET
	    #SOPS_AGE_KEY_FILE  = config.sops.secrets."environment/variables/sops_age_key".path; # SECRET
	#};
	shellAliases = {
	    ssh = "ssh -i ${config.home.homeDirectory}/sync/pass/ssh/thinkpad/thinkpad"; # SECRET
	};
    };

    # Order home-manager to restart sops-nix service.
    home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      /run/current-system/sw/bin/systemctl start --user sops-nix
    '';

    sops = {

        age.keyFile = "/home/${username}/sync/pass/age/thinkpad";
        defaultSopsFile = ./secrets.yaml;
	defaultSopsFormat = "yaml";

	# https://discourse.nixos.org/t/access-nixos-sops-secret-via-home-manager/38909/10
	defaultSymlinkPath = "/run/user/1001/secrets";
	defaultSecretsMountPoint = "/run/user/1001/secrets.d";
        
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
	    "environment/variables/gpg_home" = { sopsFile = ./secrets.yaml; };
	    "environment/variables/nix_sshopts" = { sopsFile = ./secrets.yaml; };
	    "environment/variables/pass_dir" = { sopsFile = ./secrets.yaml; };
	    "environment/variables/sops_age_key" = { sopsFile = ./secrets.yaml; };
        };
    };
}
