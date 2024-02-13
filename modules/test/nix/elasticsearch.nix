{ config, pkgs, ... }: {

  services = {
    logstash = {
      enable = true;
      #dataDir = "/home/${username}"
    };
    elasticsearch = {
      enable = true;
      #dataDir = "/home/${username}"; # Default "var/lib/elasticsearch"
    };
  };

}
