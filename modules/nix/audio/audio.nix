{ config, pkgs, username, musnix, ... }: {

  # Audio configuration + musnix
  # See more at https://nixos.wiki/wiki/PipeWire
  # See more at https://nixos.wiki/wiki/PulseAudio
  # See more at https://github.com/musnix/musnix

  users.users.${username}.extraGroups = ["audio"];
  musnix.enable = true;

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware.bluetooth.enable = true;

  # PIPEWIRE
  security.rtkit.enable = true;
  hardware.pulseaudio = {
    enable = false;
    support32Bit = true; # for gaming fix
  };

  services.pipewire = {
    enable = true;
    audio.enable = true; # use as primary sound server
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = true; # use JACK applications
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  # JACK -
  #services.jack = {
  #jackd.enable = true;
  #alsa.enable = false;
  #loopback = {
  #enable = true;
  #dmixConfig = ''
  #  period_size 2048
  #'';
  #};
  #};

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      qjackctl
      #cadence
      pulseaudio # Needed by Pipewire.
      ;
  };
}
