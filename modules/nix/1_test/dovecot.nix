{ config, pkgs, ... }: {

    services.dovecot2 = {
        enable = true;
	user = "dovecot2"; # default `dovecot2`.
	group = "dovecot2"; # default `dovecot2`.

	#enableQuota = "true"; # default `false`.
	#enablePop3 = "true"; # default `false`.
	#enablePAM = "true"; # default `true`.
	#enableLmtp = "true"; # default `false`.
	#enableImap = "true"; # default `true`.
	#enableDHE = "true"; # default `true`.
    };
}
