{
  config,
  pkgs,
  ...
}: {
  # Specify your system's drivers.
  services.xserver = {
    #enable = true;
    #videoDrivers = [ "intel" ];
    videoDrivers = ["nvidia"];
  };

  hardware = {
    cpu.intel.updateMicrocode = true; # update the cpu microcode
    #nvidiaOptimus.disable = true; # Completely disable NVIDIA graphics and use integrated

    # NVIDIA Configuration
    nvidia = {
      #package = config.boot.kernelPackages.nvidiaPackages.stable; # Use the drivers stable branch.
      #open = true; # Use the open source drivers.
      #nvidiaSettings = true;
      modesetting.enable = true;
      #forceFullCompositionPipeline = true; # Fix screen tearing
      prime = {
        #allowExternalGpu = true;
        #sync.enable = true;
        offload.enable = true; # sync or offload, one of the two
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    # OpenGL Drivers
    opengl = {
      enable = true; # vulkan
      driSupport = true; # vulkan + wine
      driSupport32Bit = true;
      setLdLibraryPath = true; # gaming extra
      extraPackages32 = with pkgs.pkgsi686Linux; [libva]; # gaming extra
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    glibc
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
  ];
}
