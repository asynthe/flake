{ config, pkgs, ... }: {

  # Input Method Editor (IME) - Fcitx5 + Mozc
  # Open fcitx-configtool and add Mozc, once it's done
  # Start with `fcitx5 -d &`.

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-configtool
      #fcitx5-lua # ?
    ];
  };

  environment.sessionVariables = {
    XMODIFIERS = "@im=fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}
