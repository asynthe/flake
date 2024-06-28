{ config, lib, pkgs, ... }: {

    programs.zsh = lib.mkIf config.programs.zsh.enable {
        sessionVariables.READER = "zathura";
        shellAliases = {
	        pdf = "zathura";
	        book = "${pkgs.fd}/bin/fd . ~/sync/archive/book --type f -e 'pdf' -e 'epub' | ${pkgs.skim}/bin/sk | xargs ${pkgs.zathura}/bin/zathura";
        };
    };

    programs.zathura = {
        enable = true;
	    extraConfig = ''
	      set guioption ""
	      #set recolor true
	      set selection-clipboard clipboard
	    '';
    };
}
