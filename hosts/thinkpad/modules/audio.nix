{ config, pkgs, username, ... }: {

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  security.rtkit.enable = true;
  hardware.pulseaudio = {
    enable = false;
    support32Bit = true; # Gaming fix
  };

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

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      pulseaudio # Needed by Pipewire.
      ;
  };

}
