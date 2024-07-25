{ config, lib, ... }: 
with lib;
let
    cfg = config.framework.audio.pipewire;
in {
    options.framework.audio.pipewire.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Pipewire audio setup and configuration.";
    };

    options.framework.audio.pipewire.lowlatency = mkOption {
        type = types.bool;
        default = false;
        description = "Enable low latency configuration.";
    };

    config = mkIf cfg.enable {

        # Pipewire audio configuration.
        # See more at https://wiki.nixos.org/wiki/Pipewire
        # See more at https://wiki.nixos.org/wiki/PulseAudio

        users.users.${config.framework.system.user}.extraGroups = [ "audio" ];
        security.rtkit.enable = true;

        # Needed by Pipewire.
        #environment.systemPackages = builtins.attrValues { inherit (pkgs) pulseaudio; }; # pulsemixer?
        hardware.pulseaudio.enable = false;
        hardware.pulseaudio.support32Bit = true; # Gaming fix.

        # Pipewirez
        services.pipewire = {
            enable = true;
            audio.enable = true; # Use as primary sound server.
            wireplumber.enable = true;
            pulse.enable = true;
            jack.enable = true; # Use JACK applications.
            alsa = {
                enable = true;
                support32Bit = true;
            };
        };

        # Low-latency setup
        services.pipewire.extraConfig.pipewire."92-low-latency" = mkIf cfg.lowlatency {
            context.properties = {
                default.clock.rate = 48000;
                default.clock.quantum = 32;
                default.clock.min-quantum = 32;
                default.clock.max-quantum = 32;
            };
        };
    };
}
