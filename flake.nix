{
  description = "asynthe's system flake";

outputs = inputs @ {
  self,
  nixpkgs,
  #nixpkgs-stable,
  #nixpkgs-wayland,
  #nix-on-droid,
  nix-darwin,
  #nix-gaming,
  home-manager,
  hyprland,
  musnix,
  ...
	}: let
  username = "asynthe";
  username_mac = "benjamindunstan";
  hostname = "genkai";
  hostname_mac = "192-168-1-123";

  linux_64 = "x86_64-linux";
  apple_silicon = "aarch64-darwin";

  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  
  in {

nixosConfigurations = {
  genkai = nixpkgs.lib.nixosSystem {
    system = "genkai";
    specialArgs = {inherit username inputs;};

    modules = [
      ./nix/laptop
      # HOME MANAGER AS A MODULE GOES INSIDE HERE !!!
    ];
    };
  };

# Home Manager as a Module
#home-manager.nixosModules.home-manager
#{
#home-manager = {
#useGlobalPkgs = true;
#useUserPackages = true;
#users.${username} = import ./nix/home/linux/home.nix;
#};
#}

# Testing Specialargs on Home Manager Module
#nixosConfigurations.${hostname} = { nixpkgs.lib.nixosSystem rec {
#({ config, lib, ... }: {
#options.home-manager.users = lib.mkOption {
#type = with lib.types; attrsOf (submoduleWith {
#specialArgs = { super = config; inherit helix; };
#});
#};
#})

# Home Manager as a Standalone
homeConfigurations = {
  ${username} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {inherit username inputs;};
    modules = [ ./home/linux/home.nix ];
  };
};

#nixOnDroidConfigurations.default = #nix-on-droid.lib.nixOnDroidConfiguration {
  #modules = [./nix/nix-on-droid];
#};

};
 inputs = {

nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

home-manager = {
  url = "github:nix-community/home-manager";
  inputs.nixpkgs.follows = "nixpkgs"; 
  # Follows the nixpkgs channel defined before, 
  # to avoid different versions of nixpkgs deps problems.
};

#nix-on-droid = {
  #url = "github:t184256/nix-on-droid/release-23.05";
  #inputs.nixpkgs.follows = "nixpkgs-stable";
  #};

#nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
#nix-gaming.url = "github:fufexan/nix-gaming";
#helix.url = "github:helix-editor/helix/23.05";

hyprland.url = "github:hyprwm/Hyprland";

musnix.url = "github:musnix/musnix";

};
}
