{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.meta.driver.nvidia;
in {
    options.meta.driver.nvidia = {
        enable = mkEnableOption "Enable nvidia driver and configuration";
        #specialisation = mkEnableOption "Enable specialisation modes";
        cache = mkOption {
            type = bool;
            default = false;
            description = "Enable cuda mantainers cachix repository.";
        };
        #mode = mkOption {
            #type = nullOr str;
            #default = null;
            #description = "Mode for Nvidia PRIME.";
        #};
        #bus_id = {
            #nvidia_gpu = mkOption {
                #type = nullOr str;
                #default = null;
                #description = "Nvidia GPU Bus ID for PRIME.";
            #};
            #intel_cpu = mkOption {
                #type = nullOr str;
                #default = null;
                #description = "Intel GPU (Integrated) Bus ID for PRIME.";
            #};
        #};
    };

    config = mkIf cfg.enable {

        #assertions = [
        #    {
        #        assertion = cfg.enable -> cfg.mode;
        #        message = "Enabling nvidia drivers requires a mode to be enabled.";
        #    }
        #    {
        #        assertion = cfg.mode != null;
        #        message = "Please specify a mode (offload/sync) for PRIME.";
        #    }
        #    {
        #        assertion = cfg.bus_id.nvidia_gpu != null;
        #        message = "Please specify the Bus ID of your Nvidia GPU.";
        #    }
        #    {
        #        assertion = cfg.bus_id.intel_cpu != null;
        #        message = "Please specify the Bus ID of your Intel CPU.";
        #    }
        #];

        # Completely disable NVIDIA graphics and use integrated.
        #hardware.nvidiaOptimus.disable = true;

        # Screen Tearing Issues (Try Prime Sync Mode first, then this option)
        #hardware.nvidia.forceFullCompositionPipeline = true;

        # -------------- Cuda Mantainers Cache --------------
        # https://github.com/carlthome/dotfiles/blob/698ae7cdaf3e77819ed6e435372af80c339272d3/modules/nixos/cuda.nix
        nix.settings = mkIf cfg.cache {
            substituters = [ "https://cuda-maintainers.cachix.org" ];
            trusted-public-keys = [ "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" ];
        };

        # -------------- Nvidia --------------
        services.xserver.videoDrivers = [ "nvidia" ];

        # RENAMED TO hardware.graphics.enable and hardware.graphics.enable32Bit``

        hardware.graphics = {
            enable = mkForce true;
            enable32Bit = mkForce true;
        };

        #hardware.opengl = {
            #enable = true; # vulkan
            #driSupport = true; # vulkan + wine
            #driSupport32Bit = true;
            #setLdLibraryPath = true; # gaming extra
            #extraPackages32 = with pkgs.pkgsi686Linux; [libva]; # gaming extra
        #};

        hardware.nvidia = {
            modesetting.enable = true; # Required
            nvidiaSettings = true;

            # Nvidia power management
            #powerManagement.enable = true;
            #powerManagement.finegrained = false;

            # Driver version (stable, beta, production [install 535], vulkan_beta, legacy_390, legacy_340)
            #package = config.boot.kernelPackages.nvidiaPackages.beta; # ???

            #open = true; # Open source kernel module, not nouveau.
        };

        # -------------- Prime --------------
        # Bus ID Values
        # You can find these values by running `lspci | grep ' VGA '`
        hardware.nvidia.prime = {
            intelBusId = "PCI:1:0:0";
            nvidiaBusId = "PCI:0:2:0";
            #intelBusId = "${config.meta.driver.nvidia.bus_id.intel_cpu}";
            #nvidiaBusId = "${config.meta.driver.nvidia.bus_id.nvidia_gpu}";
        };

        # -------------- Prime - Offload Mode --------------
        #hardware.nvidia.prime.offload = mkIf (cfg.mode == "offload") {
        #hardware.nvidia.prime.offload = {
            #enable = true;
            #enableOffloadCmd = true;
        #};

        # -------------- Prime - Sync Mode --------------
        hardware.nvidia.prime.sync.enable = true;
        #hardware.nvidia.prime.sync.enable = mkIf (cfg.mode == "sync") true;
        
        # -------------- Specialisation --------------
        # specialisation = {
        # 
        #     # Portable - Offload
        #     portable.configuration = {
        #         hardware.nvidia.prime = {
        #             sync.enable = mkForce false;
        #             offload = {
        #                 enable = mkForce true;
        #                 enableOffloadCmd = mkForce true;
        #             };
        #         };
        #     };
        # 
        #     # Gaming - Sync
        #     gaming.configuration = {
        #         hardware.nvidia.prime = {
        #             sync.enable = mkForce true;
        #             offload = {
        #                 enable = mkForce false;
        #                 enableOffloadCmd = mkForce false;
        #             };
        #         };
        #     };
        # };

        # -------------- Packages --------------
        #environment.systemPackages = builtins.attrValues {
        #    inherit (pkgs)
        #        glibc
        #        glxinfo # Check if running on gpu.
        #        zenith-nvidia
        #        nvtop-nvidia
        #        vulkan-tools
        #        #virtualgl
        #        #nvidia-offload
        #        #linuxKernel.packages.linux_6_2.bbswitch
        #        #libva
        #        #libva-utils
        #        #libdrm
        #        #mesa #mesa-demos
        #    ;
        #};
    };
}
