{ inputs, config, pkgs, lib, helix, username, hostname, ... }:
{

# genkai - Laptop
# i7-10750H / 6 Cores, 12 Threads
# NVIDIA RTX 3060 6GB

  imports = [
    ./sys.nix
    ../../wm/hyprland # hyprland's default.nix from nix/system/laptop/default.nix
    ./extra
    ./service
    ./sys
    ./user
    ./nvidia.nix # Nvidia drivers
    ./hardware-configuration.nix # Include the results of the hardware scan.
    #./timer
  ];


  # BOOT #
  # PLYMOUTH
  #boot.plymouth.enable = true;
  #fileSystems."/boot" = {
  #   device = "/dev/disk/by-uuid/xxx";
  #   fsType = "vfat";
  #};

  # BOOTLOADER
  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  # GRUB
  boot.loader = {
    grub = {
      enable = true;
      #version = 2; # deprecated
      configurationLimit = 5;
      device = "nodev";
      efiSupport = true;
      enableCryptodisk = true;
    };
  };

  boot.initrd.luks.devices = {
    crypt = {
      device = "/dev/disk/by-uuid/2fd0b0d6-7c7f-461d-8ba6-d6aa6d3a2401";
      preLVM = true;
    };
  };
  #boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/eb79a748-75bc-41d6-9b74-df1726965260";
  #boot.initrd.luks.devices."crypt".preLVM = true;
  boot.initrd.availableKernelModules = [ "aesni_intel" "cryptd" ];
  #boot.initrd.cryptoModules = [ "aes" "aes_generic" "blowfish" "twofish" "serpent" "cbc" "xts" "lrw" "sha1" "sha256" "sha512" "af_alg" "algif_skcipher" ];

  # GTK - QT -> Seems to be working better in Home Manager
  # GTK
  #gtk.iconCache.enable = true;
  #environment.etc = {
    #"xdg/gtk-2.0".source = ./gtk-2.0;
    #"xdg/gtk-3.0".source = ./gtk-3.0;
  #};
  # QT
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "adwaita-dark";
  };
  
  security.pam.services = {
    gtklock = { };
    asynthe.gnupg = {
      enable = true;
      #storeOnly = ;
      #noAutostart = ;
    };
  };

  # DBUS
  services.dbus.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    startWhenNeeded = true; # sshd will be socket-activated, it will start for each incoming connection.
    allowSFTP = true; # enable the STFP subsystem, use commands sftp and sshfs.
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false; 

  # System packages
  # I'm just using the python packages.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    git # Git must be installed before flakes.
    wget
    curl

    #helix.packages."${pkgs.system}".helix
    pulseaudio # needed by Pipewire

    ];

  ##### TESTING #####

  # testing
  #import (builtins.fetchTarball {
    #name = $pkt;
    #url = "https://github.com/NixOS/nixpkgs/pull/231195";
    #sha256 = "1fh79r4fnh9gjxjh39gcp4j7npgs5hh3qhrhx74x8x546an3i0s2";
  #})

}
