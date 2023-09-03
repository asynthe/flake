{config, ...}: {
  imports = [
    ./android.nix
    #./dns.nix
    ./gpg.nix
    ./mesh_network.nix
    ./ssh.nix
    ./vm.nix
    ./wine.nix
  ];
}
