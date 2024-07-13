{ config, pkgs, lib, ... }: {

    home.packages = builtins.attrValues { inherit (pkgs) mpvpaper; };
    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
	    video = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/video -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf start=0' '*'";
	    #playl = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/video/playlist -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf' '*'"; # FIX
    };
}
