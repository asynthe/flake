{ pkgs, ... }:
{
    nixpkgs.hostPlatform = "aarch64-darwin";

    # Auto upgrade nix package and the daemon  service.
    services.nix-daemon.enable = true;
    #nix.package = pkgs.nix;

    users.users.benjamindunstan = {
        name = "benjamindunstan";
        home = "/Users/benjamindunstan";
    };

    nix.extraOptions = ''
auto-optimise-store = true
experimental-features = nix-command flakes
extra-platforms = x86_64-darwin aarch64-darwin
    '';

    homebrew = {
        enable = true;
	casks = [
	    "discord"
	    "visual-studio-code"
	];
    };
}
