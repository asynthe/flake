{ config, nixvim, ... }: {

    programs.nixvim = {
    	clipboard = {
		    # IMPLEMENT
		    # if x -> xclip
		    # if wayland -> wl-copy
		    register = "unnamedplus";
		    providers.wl-copy.enable = true;
	    };

    	#highlight = {
	        #Comment.fg = "#ff00ff";
	        #Comment.bg = "#000000";
	        #Comment.underline = true;
	        #Comment.bold = true;
	    #};

    	opts = {

		    # Tab / Indentation
		    expandtab = true;
		    shiftwidth = 4;
		    smartindent = true;
		    softtabstop = 2;
		    tabstop = 4;
		    wrap = true;

		    # Appearance
		    cmdheight = 1;
		    #colorcolumn = "100";
		    colorcolumn = "";
		    completeopt = "menuone,noinsert,noselect";
		    scrolloff = 10;
		    signcolumn = "yes";
		    termguicolors = true;
		    number = true;

		    # Search
		    hlsearch = false;
		    ignorecase = true;
		    incsearch = true;
		    smartcase = true;

		    # Split behaviour
		    splitbelow = true;
		    splitright = true;

	    	# Behaviour
		    mouse = "a";
		    hidden = true;
		    errorbells = false;
		    swapfile = false;
	    };
    };
}
