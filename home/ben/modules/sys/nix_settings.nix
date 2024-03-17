{ config, pkgs, ... }: {

    # Fix for nixpkgs.allowUnfree = true
    # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
    
    nixpkgs.config = {
        allowUnfreePredicate = _: true;
        allowUnfree = true;
        #permittedInsecurePackages = [ # REMOVE
            #"python3.10-requests-2.29.0"
            #"electron-25.9.0"
        #];
    };
}
