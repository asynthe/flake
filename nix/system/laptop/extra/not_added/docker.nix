{
  config,
  pkgs,
  ...
}: {
  # Docker
  virtualisation.docker = {
    enable = true;
  };
}
