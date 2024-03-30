{ config, pkgs, ... }: {

  nix = {
    # Nix settings
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "ben" ]; # Required for installing Home Manager?
      trusted-users = [ "ben" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };

    # Garbage collection
    gc = {
      automatic = true;
      persistent = true; # Will do if it misses a gc because system was off.
      dates = "weekly";
      options = "--delete-older-than 4d";
    };
  };
}
