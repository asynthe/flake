{ config, pkgs, ... }: {

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "sample_db" ];
    ensureUsers = [

      #{
      #name = "nextcloud";
      #}

      {
      name = "ben";
      ensureDBOwnership = true;
      ensur
      }
    ];
  };

}
