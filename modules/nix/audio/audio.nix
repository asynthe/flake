{ config, username, ... }: {

  # Audio configuration + musnix
  # See more at https://nixos.wiki/wiki/PipeWire
  # See more at https://nixos.wiki/wiki/PulseAudio
  # See more at https://github.com/musnix/musnix

  users.users.${username}.extraGroups = ["audio"];

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware.bluetooth.enable = true;


}
