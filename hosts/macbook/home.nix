{ pkgs, ... }:
{
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
        htop
	curl
	coreutils
	jq
    ];

    programs.zsh = {
        enable = true;
	shellaliases.ls = "ls --color";
    };
}
