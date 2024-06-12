{
    imports = [

        # Un-opinionized configuration
        ./files/systemd-boot.nix

        # Not working, yet
        #./boot.nix
        ./silent.nix
        #./tmp.nix

        # Working
        ./banner.nix 
        ./console.nix
    ];
}
