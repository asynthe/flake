{ config, pkgs, ... }: {
  
  # Environment and locale
  environment = {
    shells = with pkgs; [zsh];
    binsh = "${pkgs.dash}/bin/dash"; # change sh for dash.
    variables = {
      TERMINAL = "Alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    sessionVariables = rec {
      PATH = [
        "\${XDG_BIN_HOME}"
      ];

      # XDG SPECIFICATIONS
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      XDG_STATE_HOME = "\${HOME}/.local/state";
    };
  };
}
