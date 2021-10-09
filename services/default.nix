{ config, pkgs, ... }:

{
  imports = [
    ./postgresql.nix
    ./tftpd.nix
    ./printing.nix
    ./xserver.nix
    ./openvpn.nix
  ];


  # Limit journal size
  services.journald = {
    extraConfig = "SystemMaxUsage=500M";
  };

  # Trezor Bridge
  services.trezord.enable = true;

  # Blueman
  services.blueman.enable = true;

  # OpenSSH deamon
  # services.openssh.enable = true;

 }
