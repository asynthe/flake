{
    description = "asynthe's system flake";
    inputs = {
	    # Main Inputs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

	    # Other
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
	    nixvim.url = "github:nix-community/nixvim";
	    nixvim.inputs.nixpkgs.follows = "nixpkgs";
        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        impermanence.url = "github:nix-community/impermanence";
        musnix.url = "github:musnix/musnix";
        sops-nix.url = "github:Mic92/sops-nix";
        stylix.url = "github:danth/stylix";
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

        nixos-hardware,
        nixos-wsl,
	    nixvim,
        disko,
        hyprland,
        impermanence,
        musnix,
        sops-nix,
        stylix,
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
                nixos-hardware.nixosModules.lenovo-thinkpad-t480
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
                inputs
                ;
                user = "ben";
            };
            modules = [
                ./hosts/thinkpad
		        sops-nix.nixosModules.sops
                disko.nixosModules.disko
                impermanence.nixosModules.impermanence
                musnix.nixosModules.musnix
                nixos-wsl.nixosModules.default
            ];
        };
    };

    homeConfigurations = {

        # ben
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
		        nixvim.homeManagerModules.nixvim
		        sops-nix.homeManagerModules.sops
                hyprland.homeManagerModules.default
                stylix.homeManagerModules.stylix
	        ];
        };
 
        # missingno
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
		        nixvim.homeManagerModules.nixvim
                stylix.homeManagerModules.stylix
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
