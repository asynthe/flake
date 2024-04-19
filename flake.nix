{
    description = "asynthe's system flake";

    inputs = {
        
	# Main Inputs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

	# Other
	nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs";
        impermanence.url = "github:nix-community/impermanence";
        musnix.url = "github:musnix/musnix";
        sops-nix.url = "github:Mic92/sops-nix";

        #nil.url = "github:oxalica/nil";
        #nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
        #nix-gaming.url = "github:fufexan/nix-gaming";
        #nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
        #nix-darwin = {
            #url = "github:lnl7/nix-darwin";
            #inputs.nixpkgs.follows = "nixpkgs-darwin";
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

	nixos-wsl,
        disko,
        impermanence,
        musnix,
        sops-nix,
        #nix-darwin,
        #nixpkgs-wayland,
        #nixos-06cb-009a-fingerprint-sensor,
        #nix-gaming,
        ...
    
    }: let

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
	        pkgs-stable
                inputs
                ;
                user = "ben";
		device = "/dev/nvme0n1";
            };
            modules = [
                ./hosts/thinkpad
		sops-nix.nixosModules.sops
                disko.nixosModules.disko
                impermanence.nixosModules.impermanence
                musnix.nixosModules.musnix
            ];
        };

	# PC Server
        server = nixpkgs-stable.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit
	        pkgs-stable
                inputs
                ;
                user = "server";
		device = "/dev/sda";
            };
            modules = [
                ./hosts/server
		sops-nix.nixosModules.sops
                disko.nixosModules.disko
                impermanence.nixosModules.impermanence
            ];
	};

	# WSL
        wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit
	        pkgs-stable
                inputs
                ;
                user = "missingno";
		device = "/dev/sda";
            };
            modules = [
                ./hosts/wsl
		nixos-wsl.nixosModules.default
            ];
	};
    };

    homeConfigurations = {

        # User
        ben = home-manager.lib.homeManagerConfiguration {
            #pkgs = nixpkgs.legacyPackages.x86_64-linux;
	    pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { inherit
	        pkgs-stable
                inputs
                ;
	        user = "ben";
            };
            modules = [ 
	        ./home/ben 
		sops-nix.homeManagerModules.sops
	    ];
        };
 
        # WSL
        missingno = home-manager.lib.homeManagerConfiguration {
            #pkgs = nixpkgs.legacyPackages.x86_64-linux;
            inherit pkgs;
	    extraSpecialArgs = { inherit
	        pkgs-stable
	        inputs
	        ;
	        user = "missingno";
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
