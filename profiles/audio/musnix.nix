{ config, lib, ... }: 
with lib;
let
    cfg = config.framework.audio;
in {
    options.framework.audio.musnix = mkOption {
        type = types.bool;
        default = false;
        description = "Enable audio configuration. (Musnix)";
    };

    config = mkIf cfg.musnix {
        musnix = {
            enable = true;
            #alsaSeq.enable = true;
            #ffado.enable = true; # Use the Free FireWire Audio Drivers (FFADO).
            #soundcardPciId = "00:1b.0"; # The PCI ID of the primary soundcard.

            # Kernel Options (can be set up without musnix.enable)
            #kernel = {
                #realtime = true; # False by default.
                #packages = [ pkgs.linuxPackages_latest_rt ];

                # rtirq Options (can be set up without setting musnix.enable)
                # `musnix.kernel.realtime` must be set to true
                #rtirq.enable = false;

                # Other
                #das_watchdog.enable = true; # True if musnix.kernel.realtime = true.
            #};
        };
    };
}
