{ config, lib, pkgs, ... }: 
with lib;
let
    cfg = config.services.endlessh;
in {
    options.services.endlessh.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up Endlessh.
        '';
    };

    #options.services.endlessh.go = mkOption {
        #type = types.bool;
        #default = false;
        #description = ''
          #Enable and set up Endlessh go implementation.
        #'';
    #};

    #options.services.endlessh.port = mkOption {
        #type = types.port;
        #default = 22;
        #description = ''
          #Port to be used in Endlessh.
        #'';
    #};

    config = mkIf cfg.enable {

        services.endlessh-go = {
	        enable = true;
	        #port = 22; # default `2222`.
	        #extraOptions = [ "-conn_type=tcp4" "-max_clients=8192" ];
	        #openFirewall = true;
	        #prometheus.listenAddress = ; # default `0.0.0.0`.
	        #prometheus.port = ; # default `2112`.
        };
            
        #services.endlessh = {
            #enable = true;
	        #port = 22; # default `2222`.
	        #extraOptions = [ "-6" "-d 9000" "-v" ];
	        #openFirewall = true; # default `false`.
        #};
    };
}
