{ config, inputs, ... }: {

    imports = [ 
	<nixos-wsl/modules>
    ];

    wsl = {
        enable = true;
	defaultUser = "nixos";
    };
}
