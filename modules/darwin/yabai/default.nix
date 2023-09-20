{pkgs-darwin, ...}: {
  services.yabai = {
    enable = true;
    #enableScriptingAddition = ; # false by default
    #config = {
    #extraConfig
  };

  homebrew.brews = [
    #koekeishiya/formulae/yabai # enabled by service?
    koekeishiya/formulae/shkd
  ];
}
