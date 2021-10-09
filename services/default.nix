{ config, pkgs, ... }:

{
  imports = [
 #   ./postgresql.nix
 #   ./tftpd.nix
 #   ./printing.nix
 #   ./xserver.nix
 #   ./openvpn.nix
  ];

  services = {
   dnsmasq = {
      enable = true;
      extraConfig = ''
        interface=wg0
      '';
    };
    
    openssh = {
      enable = true;
      permitRootLogin = "yes";
    };

    # Limit journal size
    journald = {
      extraConfig = "SystemMaxUsage=500M";
    };
  };

  # Trezor Bridge
  # services.trezord.enable = true;

  # Blueman
  # services.blueman.enable = true;

  # OpenSSH deamon
  # services.openssh.enable = true;

 }
