{ config, ... }: {

  hardware.nvidia.prime = {
    reverseSync.enable = true;
    #allowExternalGpu = false; # Enable if using an external GPU.
  };

}
