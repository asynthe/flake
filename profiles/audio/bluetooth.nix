{ config, pkgs, lib, ... }: 
with lib;
let
    cfg = config.audio;
in {
    options.audio.bluetooth = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Bluetooth service.";
    };

    config = mkIf cfg.bluetooth {

        hardware.bluetooth.enable = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
	            bluez-tools
	            bluetuith # Bluetooth ncurses frontend.
	        ;
        };

        services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = mkIf config.services.pipewire.enable {
            "monitor.bluez.properties" = {
                "bluez5.enable-sbc-xq" = true;
                "bluez5.enable-msbc" = true;
                "bluez5.enable-hw-volume" = true;
                "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
            };
        };
    };
}
