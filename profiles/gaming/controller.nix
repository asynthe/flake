{ config, lib, ... }:
with lib; with types;
let
    cfg = config.gaming;
in {
    options.gaming.controller = mkOption {
        type = bool;
        default = false;
        description = "Enable Xbox controller.";
    };
    
    config = mkIf cfg.controller {
        hardware = {
            xone.enable = true; # Driver.
	        xpadneo.enable = true; # Bluetooth driver.
        };
    };
}
