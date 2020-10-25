{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pam_u2f
  ];

  # Enable U2F auth
  security.pam.u2f = {
    enable = true;

    # create key: pamu2fcfg -u $USER >> /etc/u2f_keys
    authFile = ''
      /etc/u2f_keys
    '';
  };
}
