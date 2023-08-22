{ config, pkgs-darwin, ... }:
{

  # Homebrew
  # Installation of homebrew is not included.
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

      #"koekeishiya/formulae/yabai" # enabled by service?
      #"koekeishiya/formulae/shkd"
      ];

    casks = [

      # WM
      "amethyst"

      # TERM
      "alacritty"
      "kitty"

      # GUI
      "emacs"
      "logseq"
      ];

  };

}
