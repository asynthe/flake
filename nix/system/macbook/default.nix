{ config, pkgs-darwin, ... }:
{

  #imports = [
    #./shell.nix # ZSH configuration
    #./sys.nix # System configuration
    #../../wm/yabai # Yabai configuration
    #./pkgs.nix
  #];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true; # Make sure it always runs.

  # System
  system.defaults.dock.autohide = true;

  #services.nix-daemon.package = pkgs.nixFlakes; # Installs a version of nix, that doesn't need "experimental-features = nix-command flakes"
  # in /etc/nix/nix.conf

  # SHELL.NIX --------
  # Enable this so nix-darwin creates a zshrc sourcing needed environment changes.
  # If not used, bash is enabled by default.
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    enableSyntaxHighlighting = true;
  };

  # SHELL.NIX - END -------

  # YABAI CONFIG FILE -------
  services.yabai = {
    enable = true;
    #enableScriptingAddition = ; # false by default
    #config = {
    #extraConfig
  };
  
  #homebrew.brews = [
  #];
  # YABAI CONFIG FILE - END -------

  # PKGS.NIX ----------------

  # Emacs
  services.emacs = {
    enable = true;
    #package = ;
  };

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      # Updates homebrew packages on activation
      # Can make darwin-rebuild much slower
      autoUpdate = true;
      upgrade = true;
      };
    brews = [

      # SHELL
      "neovim"
      "tmux"
      "lf"
      "sk" #"fzf"

      # Rust replacements
      "bat"
      "exa"
      "zoxide"
      "fd"

      # CLI
      "yt-dlp"
      "weechat"

      #"koekeishiya/formulae/yabai" # enabled by service?
      #"koekeishiya/formulae/shkd"
    ];
    casks = [

      # WM
      "amethyst"

      # TERM
      "alacritty"
      "kitty"

      # NOTES
      "obsidian"
      "logseq"

      # GUI
      "emacs"
      "spotify"
      "discord"

    ];
  };

}
