{ config, lib, pkgs, username, ... }:
with lib;
let

  cfg_server = config.server.user;
  cfg_thinkpad = config.thinkpad.user;

in {

  options = {
    server.user.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Simple user for server.";
    };
    thinkpad.user.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Simple user for server.";
    };
  };

  config = mkMerge [
    (mkIf (cfg_server.enable) {
      users.users = {
        ben = {
           extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" "input" ];
	   initialPassword = "password";
	   isNormalUser = true;
        };
	rizuki = {
           extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" "input" ];
	   initialPassword = "password";
	   isNormalUser = true;
	};
      };

      # sudo -> doas
      security = {
        sudo.enable = false;
        doas = {
          enable = true;
          extraRules = [
	    {
	      users = [ "ben" "rizuki" ];
	      keepEnv = true;
	      persist = true; # No auth every 5 mins.
	      #noPass = true; # No auth.
	    }
	  ];
        };
      };
    })
    (mkIf (cfg_thinkpad.enable) {
      users.users.${username} = {
        shell = pkgs.zsh;
	isNormalUser = true;
	description = "にゃ！";
	extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" "input" ];
	initialPassword = "password";
      };
      programs.zsh.enable = true; # Needed by users.users.${username}.shell

      # sudo -> doas
      security = {
        sudo.enable = false;
        doas = {
          enable = true;
          extraRules = [
	    {
	      users = [ "${username}" ];
	      keepEnv = true;
	      persist = true;
	      #noPass = true;
	    }
	  ];
        };
      };

      environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
          direnv
          eza
          lf
          starship
          ueberzugpp
          fzf skim
          zoxide
          ;

        inherit (pkgs.xfce)
          xfce4-terminal
          mousepad
          ;
      };
    })
  ];
}
