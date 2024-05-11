{pkgs, ...}: {
  # Nvim
  programs.neovim.defaultEditor = true;
  home.file.".config/nvim".source = ./nvim;

  # GitHub CLI tool
  programs.gh.enable = true;
}
