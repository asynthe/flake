{ pkgs, ... }: {

    # This is the minimal configuration to get a system working.
    # Rebuild the system with only this file enabled in `default.nix`
    # Once done, enable the `./modules.nix` in `default.nix`

    system.stateVersion = "24.05";
    wsl.enable = true;

    nix.settings = {
        warn-dirty = false;
	experimental-features = [ "nix-command" "flakes" ];
    };
}
