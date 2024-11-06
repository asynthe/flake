{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.services.android;
in {
    options.meta.services.android.enable = mkOption {
        type = bool;
        default = false;
        description = ''
          Enable and set up adb and other Android related tools.
        '';
    };

    config = mkIf cfg.enable {
        
        programs.adb.enable = true;
        users.users.${config.meta.system.user}.extraGroups = [ "adbusers" ];
        virtualisation.waydroid.enable = true; # Waydroid
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                jmtpfs
                scrcpy
	        ;
        };
    };
}
