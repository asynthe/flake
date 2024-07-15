{ config, pkgs, lib, ... }: 
with lib;
let
    cfg = config.system.bluetooth;
in {
    options.system.bluetooth.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable Bluetooth service.
        '';
    };

    config = mkIf cfg.enable {
        hardware.bluetooth.enable = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                bluez
	            bluez-tools
	            bluetuith # Bluetooth ncurses frontend.
	        ;
        };
    };
}
