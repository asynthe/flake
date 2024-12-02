{ config, pkgs, lib, ... }: 
with lib; with types;
let
    cfg = config.meta.audio;
in {
    options.meta.audio.bluetooth = mkOption {
        type = bool;
        default = false;
        description = "Enable Bluetooth service.";
    };

    config = mkIf cfg.bluetooth {

        services.blueman.enable = true;
        hardware.bluetooth = {
            enable = true;
            package = pkgs.bluez;
            powerOnBoot = true;
            settings.General = {
                #Enable = "Source,Sink,Headset,Gateway,Handsfree";
                Disable = "Headset";
                DiscoverableTimeout = 0;
                FastConnectable = true;
            };
            settings.Policy.AutoEnable = true;
        };

        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
	            bluez-tools
	            bluetuith # Bluetooth ncurses frontend.
	        ;
        };

        #services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = mkIf config.services.pipewire.enable {
            #"monitor.bluez.properties" = {
                #"bluez5.enable-sbc-xq" = true;
                #"bluez5.enable-msbc" = true;
                #"bluez5.enable-hw-volume" = true;
                #"bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
            #};
        #};
    };
}
