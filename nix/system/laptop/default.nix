{ inputs, config, pkgs, lib, helix, username, ... }:

# genkai - Laptop
# i7-10750H / 6 Cores, 12 Threads
# NVIDIA RTX 3060 6GB

let 

  user = "asynthe";
  hostname = "genkai";

in {

  imports = [

    ../../wm/hyprland # hyprland's default.nix from nix/system/laptop/default.nix
    ./extra
    ./service
    ./sys
    ./user
    #./timer
    
    ./nvidia.nix # Nvidia drivers
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

  ];

  # Wshowkeys - A wayland keystrokes show
  programs.wshowkeys.enable = true;

  # Wireshark
  programs.wireshark = {
    enable = true;
    #package = [];
  }; 

  # CUPS 
  # Linux printer drivers + hp.
  services.printing.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # OPENRGB
  services.hardware.openrgb = {
    enable = true;
    #server.port = ....; # from 0 to 65535, default 6742
    #package = with pkgs; [ ];
    motherboard = "intel"; # CPU family of motherboard, amd, intel or null.
  };

  nix = {
    gc = { # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };
    settings = {
      system-features = [ "recursive.nix" ];
      auto-optimise-store = true;
      trusted-users = [ "${username}" ];
      experimental-features = [ "nix-command" "flakes" "recursive-nix" ];
      };
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
    #copySystemConfiguration = true; 
    # Copies this file to /run/current-system/configuration.nix and runs from there.
    # Not supported by flakes
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    "zfs"
    "ntfs"
    "fat"
    "vfat"
    "exfat"
    "cifs" # mount windows share
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #system.stateVersion = "22.11"; # Did you read the comment?



  ##### TESTING #####

  # testing
  #import (builtins.fetchTarball {
    #name = $pkt;
    #url = "https://github.com/NixOS/nixpkgs/pull/231195";
    #sha256 = "1fh79r4fnh9gjxjh39gcp4j7npgs5hh3qhrhx74x8x546an3i0s2";
  #})

}
