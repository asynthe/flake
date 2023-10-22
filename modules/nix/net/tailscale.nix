{config, ...}: {

  services = {
    tailscale = {
      enable = true;
      #port = ; # From 0 to 65535, default 41641
      #package = with pkgs; [ tailscale ];
      #useRoutingFeatures = #"client" #"server" #"both"
    };
    # Open source coordination server for Tailscale
    #headscale = {
      #enable = true;
      #};
  };

}
