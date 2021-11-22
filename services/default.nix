{ config, pkgs, ... }:

{
  imports = [
    ./postgresql.nix
    ./tftpd.nix
    ./printing.nix
    ./xserver.nix
    ./openvpn.nix
    ./spotifyd.nix
  ];


  # Limit journal size
  services.journald = {
    extraConfig = "SystemMaxUsage=500M";
  };
 
  # Trezor Bridge
  services.trezord.enable = true;

  # Blueman
  services.blueman.enable = true;

  services.picom.enable = true;

  # OpenSSH deamon
  services.openssh.enable = true;

   # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "* * * * *      root    uptime | awk '{print $2 \" \" $3 \" \" $4 \" \" substr($5, 1, length($5)-1)}' > /tmp/uptime"
    ];
  };

 }
