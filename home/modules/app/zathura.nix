{ config, lib, pkgs, ... }: {

    programs.zsh = lib.mkIf config.programs.zsh.enable {
        sessionVariables.READER = "zathura";
        shellAliases = {
	        pdf = "zathura";
	        book = "${pkgs.fd}/bin/fd . ~/sync/archive/book/reading --type f -e 'pdf' -e 'epub' | ${pkgs.skim}/bin/sk | xargs zathura";

        };
    };

    stylix.targets.zathura.enable = lib.mkForce false;
    programs.zathura = {
        enable = true;
	    extraConfig = ''
# Settings
set guioptions ""
set selection-clipboard clipboard
set adjust-open "best-fit"
set pages-per-row 1
set zoom-min 10
set render-loading "false"

# Scroll
set scroll-page-aware "true"
#set smooth-scroll "true"
set scroll-full-overlap 0.01
#set scroll-step 100
set scroll-step 50

# Keybinds
unmap f
map f toggle_fullscreen
map [fullscreen] f toggle_fullscreen

# Start in dark mode
set recolor true
#set recolor-lightcolor "#E0E0E0" #06
set recolor-reverse-video "true"
#set recolor-keephue "true"

# UI
set font "Iosevka Nerd Font 16"
set default-bg "#000000" #00
set default-fg "#F7F7F6" #01

set statusbar-fg "#B0B0B0" #04
set statusbar-bg "#000000" #01
	    '';
    };
}
