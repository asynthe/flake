{ config, pkgs, ... }: {

    services.mako = {
        font = "JetBrains Mono Nerd Font 14";
        enable = true;
	icons = true;
	anchor = "bottom-right";

	width = 350;
	padding = "10";
	margin = "10";

	defaultTimeout = 5000;
	ignoreTimeout = true;

	borderRadius = 0;
	borderSize = 0;

	borderColor = "#bb9af7";
	backgroundColor = "#24283b";
	textColor = "#a9b1d6";
    };
}
