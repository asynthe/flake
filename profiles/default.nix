{
    imports = [ 
        ./audio/bluetooth.nix
        ./audio/musnix.nix
        ./audio/pipewire.nix

        ./boot/banner.nix
        ./boot/bootloader.nix
        ./boot/cleantmp.nix
        ./boot/console.nix
        ./boot/secure.nix
        ./boot/silent.nix

        ./driver/displaylink.nix
        ./driver/nvidia.nix

        ./gaming/controller.nix
        ./gaming/gamemode.nix
        ./gaming/steam.nix

        ./nix/cache.nix
        ./nix/settings.nix

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

        ./system/configuration.nix
        ./system/keyboard.nix
        ./system/language.nix
        ./system/networking.nix
        ./system/ssd.nix
        ./system/user.nix

        # !!! Not yet optionized.
        ./vm/libvirt.nix
        #./vm/virtualbox.nix
        ./vm/vmware.nix
        
        # !!! In progress
        ./vpn/mullvad.nix
    ];
}
