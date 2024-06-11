{ config, pkgs, lib, ... }: 
with lib;
let
    cfg = config.system.nvidia;
in {
    options.system.nvidia.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable nvidia driver and configuration.";
    };

    config = mkIf cfg.enable {

        # !!! CHECK AND IMPLEMENT VIMJOYERS VIDEO

        # FIND and add on top.
        #nix.settings = {
            #subtituters = [ " " ];
            #trusted-public-keys = [ "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" ];
        #};

        # OPTION
        # Put `home-manager.wayland.windowManager` in a `let` expression.
        # home-manager.wayland.windowManager.hyprland.enableNvidiaPatches = config.home-manager.wayland.windowManager.hyprland.enable;

        # OPTION
        # Completely disable NVIDIA graphics and use integrated.
        #hardware.nvidiaOptimus.disable = true;

        services.xserver.videoDrivers = ["nvidia"];
        hardware.opengl = {
            enable = true; # vulkan
            driSupport = true; # vulkan + wine
            driSupport32Bit = true;
            #setLdLibraryPath = true; # gaming extra
            #extraPackages32 = with pkgs.pkgsi686Linux; [libva]; # gaming extra
        };

        hardware.nvidia = {
            modesetting.enable = true; # Required
            nvidiaSettings = true;
            # Driver version (stable, beta, production [install 535], vulkan_beta, legacy_390, legacy_340)
            package = config.boot.kernelPackages.nvidiaPackages.beta;
            open = true; # Open source kernel module, not nouveau.

            #forceFullCompositionPipeline = true; # Fix screen tearing
        };


        # Bus ID Values
        hardware.nvidia.prime = {
            intelBusId = "PCI:0:2:0"; # OPTION
            nvidiaBusId = "PCI:1:0:0"; # OPTION
        };


        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                glibc # NEEDED?
                glxinfo # Check if running on gpu.
                zenith-nvidia
      nvtop-nvidia
      vulkan-tools
   
      #virtualgl
      #nvidia-offload
      #linuxKernel.packages.linux_6_2.bbswitch
      #libva
      #libva-utils
      #libdrm
      #mesa #mesa-demos
    ;
  };

    };
}
