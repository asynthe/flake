{ username, ... } @ args:

# MacBook Pro

let
  username = "ben";
  #hostname = "macbook"; (?)
in {
  imports = [
    ../../modules/darwin
    ../../secrets/darwin.nix
  ];

  nixpkgs.overlays = import ../../overlays args;

  networking.hostname = hostname;


  };

  nix.settings.trusted-users = [username];

}
