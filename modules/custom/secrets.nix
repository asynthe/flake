{ config, lib, pkgs, username, sops-nix, ... }: 

with lib;
let

  cfg_server = config.server.secrets;
  cfg_thinkpad = config.thinkpad.secrets;

in {

    # Custom Options
    config = mkMerge [
        (mkIf (cfg_server.enable) { 
	    sops.age.sshKeyPaths = [ "/home/${username}/sync/pass/ssh/server/server" ];
	    sops.age.keyFile = /home/${username}/sync/pass/age/ben.txt;
            # Here environment variable that sets SOPS_AGE_FILE
	})
	(mkIf (cfg_thinkpad.enable) { 
	    sops.age.sshKeyPaths = [ "/home/${username}/sync/pass/ssh/thinkpad/thinkpad" ];
	    sops.age.keyFile = /home/${username}/sync/pass/age/ben.txt;
            # Here environment variable that sets SOPS_AGE_FILE
	})
    ];
    options = {
        server.secrets.enable = mkOption {
            type = types.bool;
	    default = false;
	    description = "Enable secrets for server";
	};

	thinkpad.secrets.enable = mkOption {
            type = types.bool;
	    default = false;
	    description = "Enable secrets for thinkpad";
        };
    };
}
