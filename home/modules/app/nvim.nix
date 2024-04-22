{ config, pkgs, nixvim, ... }: {
    
    programs.nixvim = {
        enable = true;

	clipboard = {
	    # IMPLEMENT
	    # if wayland -> wl-copy
	    # if X -> xclip

	    register = "unnamedplus";
	    providers.wl-copy.enable = true;
	};


	plugins = {
	    lualine.enable = true;
	};

	#colorschemes = {
	    #gruvbox.enable = true;
	#};

	opts = {
	    number = true;
	    shiftwidth = 4;
	};
    };
}
