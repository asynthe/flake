{ config, pkgs, lib, ... }: {

    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
	    video = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/video -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf' '*'";
	    #playl = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/video/playlist -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf' '*'"; # FIX
    };

    home.packages = builtins.attrValues { inherit (pkgs) mpvpaper; };
}