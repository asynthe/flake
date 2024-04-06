{ config, ... }: {

  hardware.nvidia.prime = {
    sync.enable = true;
  };

}
