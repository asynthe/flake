{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      inxi
      btop
      strace # System call monitoring
      ltrace # Library call monitoring
      iotop # IO monitoring
      iftop # Network monitoring
      lsof # List open files
      lshw # List hardware details

      # System Tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb
      ;
  };
}
