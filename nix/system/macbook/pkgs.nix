{ config, pkgs-darwin, ... }:
{

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
      "neovim"
      "tmux"
      "lf"
      ];
    casks = [
      "alacritty"
      "amethyst"
      "logseq"
      "discord"
      "iina"
      ];
  };

}
