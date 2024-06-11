{ config, pkgs, user, lib, ... }: 
with lib;
let
    cfg = config.system.audio;
in {
    options.system.audio.pipewire = mkOption {
        type = types.bool;
        default = false;
        description = "Enable audio configuration. (Pipewire)";
    };

    config = mkIf cfg.pipewire {

        # Pipewire audio configuration.
        # See more at https://nixos.wiki/wiki/Pipewire
        # See more at https://nixos.wiki/wiki/PulseAudio

        sound.enable = true;
        users.users.${user}.extraGroups = [ "audio" ];
        sound.mediaKeys.enable = true;
        security.rtkit.enable = true;

        # Needed by Pipewire.
        #environment.systemPackages = builtins.attrValues { inherit (pkgs) pulseaudio; }; # pulsemixer?
        hardware.pulseaudio.enable = false;
        hardware.pulseaudio.support32Bit = true; # Gaming fix.

        # Pipewirez
        services.pipewire = {
            enable = true;
            audio.enable = true; # Use as primary sound server
            wireplumber.enable = true;
            pulse.enable = true;
            jack.enable = true; # Use JACK applications
            alsa = {
                enable = true;
                support32Bit = true;
            };
        };
    };
}
