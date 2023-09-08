{ config, ... }: {

  # Silent boot
  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "log_level=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      #"nohibernate"
    ];
    consoleLogLevel = 0;
    supportedFilesystems = [
      "zfs"
      ];
    

  # Plymouth boot splash screen
  boot.plymouth.enable = true;

}
