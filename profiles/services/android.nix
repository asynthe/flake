{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.services.android;
in {
    options.services.android.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up adb and other Android related tools.
        '';
    };

    config = mkIf cfg.enable {
        
        programs.adb.enable = true;
        users.users.${config.system.configuration.user}.extraGroups = [ "adbusers" ];
        virtualisation.waydroid.enable = true; # Waydroid
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                jmtpfs
                scrcpy
	        ;
        };
    };
}
