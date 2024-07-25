{
    description = "asynthe's system flake";
    inputs = { # Main Inputs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

	    # Other
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs";
        impermanence.url = "github:nix-community/impermanence";
        lanzaboote.url = "github:nix-community/lanzaboote";
        lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
        musnix.url = "github:musnix/musnix";
        sops-nix.url = "github:Mic92/sops-nix";
        stylix.url = "github:danth/stylix";

        # Apps
	    nixvim.inputs.nixpkgs.follows = "nixpkgs";
	    nixvim.url = "github:nix-community/nixvim";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        swww.url = "github:LGFae/swww";
        #nixos-06cb-009a-fingerprint-sensor = {
            #url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
            #inputs.nixpkgs.follows = "nixpkgs";
        #};
    };

    #outputs = inputs @ {
    outputs = {

        # Main
        self,
        nixpkgs,
	    nixpkgs-stable,
        home-manager,

        # Other
        nixos-hardware,
        disko,
        impermanence,
        lanzaboote,
        musnix,
        sops-nix,
        stylix,

        # Apps
	    nixvim,
        hyprland,
        swww,
        #nixos-06cb-009a-fingerprint-sensor,
        ...
    
    #}: let
	    #system = "x86_64-linux";
        #pkgs = nixpkgs.legacyPackages.${system};
        #pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    
    } @ inputs: let inherit (self) outputs;

        # Supported systems
        systems = [
            "aarch64-linux"
            "i686-linux"
            "x86_64-linux"
            "aarch64-darwin"
            "x86_64-darwin"
        ];

        # Attribute -> calling a function you call to it passing each system as an argument.
        forAllSystems = nixpkgs.lib.genAttrs systems;
        
	    #system = "x86_64-linux";
        #pkgs = nixpkgs.legacyPackages.${system};
        #pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in {
        # Custom packages
        # `nix-build`, `nix shell nixpkgs#<custompkg>`, etc.
        #packages = forAllSystems (system: import ./other/pkgs nixpkgs.legacyPackage.${system});

        # Formatter for nix files -> `nix fmt`
        # Options: `alejandra`, `nixpkgs-fmt`
        #formatter = forAllSystems (system: nixpkgs.legacyPackage.${system}.alejandra);

        # Custom packages and overlays (modifications)
        #overlays = import ./other/overlays {inherit inputs;};

        # Reusable modules to export, nixos and home manager
        # Usually stuff you would upstream into nixpkgs and home-manager ???
        #nixosModules = import ./modules/nixos;
        #homeManagerModules = import ./modules/home-manager;

        # NixOS configurations
        nixosConfigurations = {

            # Burst
            #burst = nixpkgs.lib.nixosSystem {
                #system = "x86_64-linux";
                #specialArgs = { 
                    #inherit pkgs-stable inputs;
                        #user = "meow";
		                #device = "/dev/vda"
                    #;
                #};
                #modules = [
                    #./hosts/burst
		            #sops-nix.nixosModules.sops
                    #disko.nixosModules.disko
                    #impermanence.nixosModules.impermanence
                    #lanzaboote.nixosModules.lanzaboote
                    #musnix.nixosModules.musnix
                #];
            #};

            # Thinkpad
            thinkpad = nixpkgs.lib.nixosSystem {
                #system = "x86_64-linux";
                specialArgs = { 
                    #inherit pkgs-stable inputs;
                    inherit inputs outputs;
                        user = "ben";
	                    device = "/dev/nvme0n1";
                };
                modules = [
                    ./hosts/thinkpad
                    nixos-hardware.nixosModules.lenovo-thinkpad-t480
	                sops-nix.nixosModules.sops
                    disko.nixosModules.disko
                    impermanence.nixosModules.impermanence
                    lanzaboote.nixosModules.lanzaboote
                    musnix.nixosModules.musnix
                ];
            };
            
	        # PC Server
            #server = nixpkgs-stable.lib.nixosSystem {
                #system = "x86_64-linux";
                #specialArgs = { 
                    #inherit pkgs-stable inputs;
                        #user = "server";
	                    #device = "/dev/sda"
                    #;
                #};
                #modules = [
                    #./hosts/server
	                #sops-nix.nixosModules.sops
                    #disko.nixosModules.disko
                    #impermanence.nixosModules.impermanence
                    #lanzaboote.nixosModules.lanzaboote
                #];
	        #};
        };

        # Home Manager configurations
        homeConfigurations = {

            # ben
            ben = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux; # Required by Home Manager.
	            #pkgs = nixpkgs.legacyPackages.${system};
                extraSpecialArgs = {inherit inputs outputs;
                #extraSpecialArgs = { 
                    #inherit pkgs-stable inputs;
	                    user = "ben"
                    ;
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
            #missingno = home-manager.lib.homeManagerConfiguration {
                #pkgs = nixpkgs.legacyPackages.x86_64-linux;
                #inherit pkgs;
	            #extraSpecialArgs = {
                    #inherit pkgs-stable inputs;
	                    #user = "missingno"
                    #;
	            #};
	            #modules = [
	                #./home/missingno
	                #nixvim.homeManagerModules.nixvim
                    #stylix.homeManagerModules.stylix
	            #];
            #};
        };
    };
}
