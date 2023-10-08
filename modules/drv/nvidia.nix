{
  config,
  pkgs,
  ...
}: {

  # Enable OpenGL
  hardware.opengl = {
    enable = true; # vulkan
    driSupport = true; # vulkan + wine
    driSupport32Bit = true;
    #setLdLibraryPath = true; # gaming extra
    #extraPackages32 = with pkgs.pkgsi686Linux; [libva]; # gaming extra
    #extraPackages = with pkgs; [
      #vaapiVdpau
      #libvdpau-va-gl
    #];
  };
  
  # Specify your system's drivers.
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    cpu.intel.updateMicrocode = true; # update the cpu microcode
    #nvidiaOptimus.disable = true; # Completely disable NVIDIA graphics and use integrated
  };

    # NVIDIA Configuration
  hardware.nvidia = {
    # Driver version (stable, beta, production [install 535], vulkan_beta, legacy_390, legacy_340)
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    #open = true; # Use the open source drivers.
    nvidiaSettings = true;
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
