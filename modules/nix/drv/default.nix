{config, ...}: {
  imports = [
    #./amd.nix
    ./nvidia.nix
    ./displaylink.nix
  ];
}
