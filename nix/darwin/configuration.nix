{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    vim
    neofetch
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

}
