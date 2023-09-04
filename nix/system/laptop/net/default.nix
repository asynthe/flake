{config, ...}: {
  imports = [
    ./dns.nix
    ./i2p.nix
    ./mesh_network.nix
    ./ssh.nix
    ./weechat.nix
  ];
}
