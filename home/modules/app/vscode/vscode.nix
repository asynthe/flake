{ pkgs, ... }: {

    programs.vscode = {
        enable = true;

        # -> settings.nix
        userSettings = {
            "breadcrumbs.enabled" = false;
            "editor.fontFamily" = "JetBrainsMono Nerd Font";
            #"editor.fontSize" = 13;
            "editor.fontLigatures" = true;
            "editor.lineNumbers" = "on";
            "editor.minimap.enabled" = false;
            "editor.padding.top" = 30;
            "editor.scrollbar.horizontal" = "hidden";
            "editor.scrollbar.vertical" = "hidden";
            "editor.tabSize" = 2;
            "editor.wordWrap" = "on";
            "window.menuBarVisibility" = "compact";
            "window.zoomLevel" = 2;
            "workbench.activityBar.location" = "hidden";
            "workbench.colorTheme" = "Dark SynthWave '84";
            "workbench.editor.showTabs" = "none";
            "workbench.list.openMode" = "doubleClick";
            "workbench.statusBar.visible" = false;
        };

        # -> keybindings.nix
        #keybindings = {
        #};

        # -> extensions.nix
        extensions = with pkgs.vscode-extensions; [
            asvetliakov.vscode-neovim
            bbenoist.nix
            eamodio.gitlens
            ms-azuretools.vscode-docker
            ms-python.python
            ms-python.vscode-pylance
            ms-vscode-remote.remote-ssh
            sumneko.lua
            #vscodevim.vim
        ];
    };
}
