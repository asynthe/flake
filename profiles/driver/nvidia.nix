{ config, lib, pkgs, ... }: 
with lib;
let
    cfg = config.framework.driver.nvidia;
in {
    options.framework.driver.nvidia.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable nvidia driver and configuration.";
    };

    #options.driver.nvidia.setting = mkOption {
        #type = types.str;
    #};

    options.framework.driver.nvidia.cache = mkOption {
        type = types.bool;
        default = false;
        description = "Enable cuda mantainers cachix repository.";
    };

    config = mkIf cfg.enable {

        # Cuda mantainers cachix
        # https://github.com/carlthome/dotfiles/blob/698ae7cdaf3e77819ed6e435372af80c339272d3/modules/nixos/cuda.nix
        nix.settings = mkIf cfg.cache {
            substituters = [ "https://cuda-maintainers.cachix.org" ];
            trusted-public-keys = [ "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" ];
        };

        services.xserver.videoDrivers = [ "nvidia" ];
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
        
        # -------------------------------------------------
        # IMPLEMENT FROM HERE DOWN BELOW
        # -------------------------------------------------

        # Prime Offload
        #hardware.nvidia.prime.enable = true;
        #hardware.nvidia.prime.enableOffloadCmd = true;

        # Sync
        #hardware.nvidia.prime.sync.enable = true;

        # Reverse Sync
        #hardware.nvidia.prime.reverseSync.enable = true;
        #hardware.nvidia.prime.allowExternalGpu = false; # Enable if using a external GPU.
        
        # OPTION
        # Completely disable NVIDIA graphics and use integrated.
        #hardware.nvidiaOptimus.disable = true;
    };
}
