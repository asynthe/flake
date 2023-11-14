{config, ...}: {

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  #services.stubby.enable = true;
  #services.dnscrypt-proxy2 = {
    #enable = true;
    #upstreamDefaults = true; # Disable if doing dnscrypt config from scratch.
    #configFile = "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"; # Path to TOML config file.
    #settings = {
    #};
  };

  #environment.systemPackages = builtins.attrValues {
    #inherit
      #(pkgs)
      #dnscrypt-proxy2
      #dnscrypt-wrapper
      #dnsproxy
      #doggo
      #;
  #};
}
