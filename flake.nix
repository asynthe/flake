{
    description = "asynthe's system flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable.
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11"; # Stable.
        home-manager.url = "github:nix-community/home-manager"; # Follows nixpkgs unstable.
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

        impermanence.url = "github:nix-community/impermanence";
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix.url = "github:Mic92/sops-nix";
        musnix.url = "github:musnix/musnix";

        # WSL
        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager-wsl.url = "github:viperML/home-manager-wsl";

        #nil.url = "github:oxalica/nil";
        #nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
        #nix-gaming.url = "github:fufexan/nix-gaming";
        #helix.url = "github:helix-editor/helix/23.05";
        #hyprland.url = "github:hyprwm/Hyprland";
        #rust-overlay.url = "github:oxalica/rust-overlay";
 
        #nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
        #nix-darwin = {
            #url = "github:lnl7/nix-darwin";
            #inputs.nixpkgs.follows = "nixpkgs-darwin";
        #};

        #nix-on-droid = {
            #url = "github:t184256/nix-on-droid/release-23.05";
            #inputs.nixpkgs.follows = "nixpkgs-stable";
        #};

        #nixos-06cb-009a-fingerprint-sensor = {
            #url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
            #inputs.nixpkgs.follows = "nixpkgs";
        #};
    };

    outputs = inputs @ {

        self,
        nixpkgs,
	nixpkgs-stable,
        home-manager,
        disko,
        impermanence,
        sops-nix,
        musnix,
        nixos-wsl,
	home-manager-wsl,

        #hyprland,
        #nix-darwin,
        #nixpkgs-wayland,
        #nixos-06cb-009a-fingerprint-sensor,
        #nix-gaming,
        #nix-on-droid,
        ...
    
    }: let

        #username = "asynthe";
        #hostname = "thinknya";
        #username_mac = "benjamindunstan";
        #hostname_mac = "Benjis-Macbook";
	system = "x86_64-linux";
	lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
	pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  
    in {

    nixosConfigurations = {

        # Thinkpad
        thinkpad = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit
                inputs
		pkgs-stable
                ;
                username = "ben";
		device = "/dev/nvme0n1";
            };
            modules = [
                ./hosts/thinkpad
                disko.nixosModules.disko
                impermanence.nixosModules.impermanence
		sops-nix.nixosModules.sops
                musnix.nixosModules.musnix
            ];
        };

	# PC Server
        server = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit
                inputs
		pkgs-stable
                ;
                username = "server";
		device = "/dev/sda";
            };
            modules = [
                ./hosts/server
                disko.nixosModules.disko
                impermanence.nixosModules.impermanence
		sops-nix.nixosModules.sops
                musnix.nixosModules.musnix
            ];
	};

	# WSL
        wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit
                inputs
		pkgs-stable
                ;
                user = "ben";
            };
            modules = [
                ./hosts/wsl
                disko.nixosModules.disko
                nixos-wsl.nixosModules.wsl
            ];
        };
    };

    homeConfigurations = {

        # Thinkpad - User
        ben = home-manager.lib.homeManagerConfiguration {
            #pkgs = nixpkgs.legacyPackages.x86_64-linux;
            inherit pkgs;
            extraSpecialArgs = { inherit
                inputs
		pkgs-stable
                ;
	        username = "ben";
            };
            modules = [ 
	        ./home/ben 
	    ];
        };
 
        # WSL - User
        missingno = home-manager.lib.homeManagerConfiguration {
            #pkgs = nixpkgs.legacyPackages.x86_64-linux;
            inherit pkgs;
	    extraSpecialArgs = { inherit
	        inputs
		pkgs-stable
	        ;
	        username = "missingno";
	    };
	    modules = [
	        ./home/missingno
	    ];
        };
    };

    #darwinConfigurations = {

        # Apple Silicon M1
        #silicon = nix-darwin.lib.darwinSystem {
            #system = "${apple_silicon}";
            #specialArgs = { inherit 
		#inputs
	        #username_mac 
		#;
	    #};
            #modules = [ 
	        #./hosts/macos 
	    #];
        #};
    #};

    # Closing `Outputs` bracket.
    };
}
