{config, ...}: {
  imports = [
    ./android.nix
    ./gpg.nix
    ./ssh.nix
    ./vm.nix
    ./wine.nix
  ];
}
