{
  config,
  pkgs,
  ...
}: {
  services.clamav = {
    daemon = {
      enable = true;
      #settings = ;
    };
    updater = {
      enable = true;
      #settings = ;
      #interval = ;
      #frequency = ;
    };
  };
}
