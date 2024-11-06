{ config, lib, pkgs, modulesPath, ... }: {

    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/29e6e0af-4d81-4456-a9a6-664c66257973";
        options = [ "noatime" "nodiratime" "discard" ];
        fsType = "xfs";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/CB5D-7D02";
        fsType = "vfat";
    };

    swapDevices = [ ];
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;
}
