{
  config,
  pkgs-darwin,
  ...
}: {
  # Enable this so nix-darwin creates a zshrc sourcing needed environment changes.
  # If not used, bash is enabled by default.
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    enableSyntaxHighlighting = true;
  };
}
