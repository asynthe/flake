{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.framework.services.android;
in {
    options.framework.services.android.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up adb and other Android related tools.
        '';
    };

    config = mkIf cfg.enable {
        
        programs.adb.enable = true;
        users.users.${config.framework.system.user}.extraGroups = [ "adbusers" ];
        virtualisation.waydroid.enable = true; # Waydroid
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                jmtpfs
                scrcpy
	        ;
        };
    };
}
