{ config, nixvim, ... }: {

    imports = [
	./keymaps.nix
	./opts.nix
	./plugins.nix
    ];
    
    programs.nixvim = {
        enable = true;
	#colorschemes = {
	    #cyberdream.enable = true;
	    #gruvbox.enable = true;
	#};

	#highlight = {
	    #Comment.fg = "#ff00ff";
	    #Comment.bg = "#000000";
	    #Comment.underline = true;
	    #Comment.bold = true;
	#};
    };
}
