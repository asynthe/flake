{pkgs, ...}: {
  # Emacs PGTK + Overlay
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
}
