{ config, username, ... }: {

  nix = {

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 4d";
    };

    # Nix settings
    settings = {
      auto-optimise-store = true;
      trusted-users = ["${username}"];
      system-features = ["big-parallel"];
      experimental-features = ["nix-command" "flakes"];
      #system-features = ["recursive.nix"];
      #experimental-features = ["nix-command" "flakes" "recursive-nix"];
      warn-dirty = false;
    };
  };
}
