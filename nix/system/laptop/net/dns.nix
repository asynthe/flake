{
  config,
  pkgs,
  ...
}: {
  #services.stubby.enable = true;
  services.dnscrypt-proxy2 = {
    enable = true;
    #upstreamDefaults = true; # Disable if doing dnscrypt config from scratch.
    #configFile = "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"; # Path to TOML config file.
    #settings = {
    #};
  };

  #environment.systemPackages = with pkgs; [
  #dnscrypt-proxy2
  #dnscrypt-wrapper
  #dnsproxy
  #doggo
  #];
}
