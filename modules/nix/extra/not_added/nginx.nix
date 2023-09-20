{
  config,
  pkgs,
  ...
}: {
  services.nginx = {
    enable = true;
    #recommendedProxySettings = true;
    #recommendedTlsSettings = true;
    #package = pkgs.nginxStable.override { openssl = pkgs.libressl; }; # Replace openssl with libressl
    #additionalModules = with pkgs.nginxModules; [ modsecurity ];
    #virtualHosts."blog.example.com" = {
    #enableACME = true;
    #forceSSL = true;
    #root = "/var/www/blog";
    #basicAuth = { user = "password"; anotherUser = "..."; };
    #};
    #appendHttpConfig = "listen 127.0.0.1:80;";
  };
  #security.acme.certs = {
  #"blog.example.com".email = "youremail@address.com";
  #};
}
