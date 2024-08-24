{
    /*
    A main import of all the options.
    So I can disable or enable them in a modular way.
    */

    imports = [ 

        # -------------- Audio --------------
        ./audio/bluetooth.nix
        ./audio/musnix.nix
        ./audio/pipewire.nix

        # -------------- Bootloader --------------
        ./boot/banner.nix
        ./boot/bootloader.nix
        ./boot/cleantmp.nix
        ./boot/console.nix
        ./boot/secure.nix
        ./boot/silent.nix

        # -------------- Drivers --------------
        ./driver/displaylink.nix
        ./driver/nvidia.nix

        # -------------- Disk configuration --------------
        #./disk/encryption.nix
        ./disk/filesystem.nix
        ./disk/persistence.nix
        ./disk/ssd.nix

        # -------------- Gaming --------------
        ./gaming/controller.nix
        ./gaming/gamemode.nix
        ./gaming/steam.nix

        # -------------- Nix Settings --------------
        ./nix/settings.nix

        # -------------- Services --------------
        ./services/android.nix
        ./services/docker.nix
        #./services/endlessh.nix
        ./services/flatpak.nix
        ./services/grafana.nix
        ./services/i2pd.nix
        ./services/locate.nix
        ./services/qbittorrent-nox.nix
        ./services/sql.nix
        ./services/ssh.nix
        ./services/sshfs.nix
        ./services/syncthing.nix
        ./services/wine.nix
        ./services/xmr.nix

        # -------------- System --------------
        ./system/configuration.nix
        ./system/keyboard.nix
        ./system/language.nix
        ./system/networking.nix
        ./system/user.nix

        # !!! Not yet optionized.
        #./vm/libvirt.nix
        #./vm/virtualbox.nix
        #./vm/vmware.nix
        
        # !!! In progress
        #./vpn/mullvad.nix
    ];
}
