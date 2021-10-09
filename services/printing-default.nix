{ config, pkgs, ...}:

{
  # Enable CUPS to print documents
  services.printing = {
    enable = true;
    drivers = [ 
      pkgs.brlaser
      #pkgs.utsushi
    ];
  #  browsing = true;
  #  webInterface = true;
  #  defaultShared = true;
  #  listenAddresses = [ "*:631" ];
  #  clientConf = "ServerName example.com";
  };
 
  # Enable automatic discovery of the printer from other Linux systems with avahi running.
  # services.avahi.enable = true;
  # services.avahi.publish.enable = true;
  # services.avahi.publish.userServices = true;
  # services.avahi.nssmdns = true;

  # Enable Epson printing drivers
  # hardware.sane = {
  #   enable = true;
  #   extraBackends = [ pkgs.utsushi ];
  # };
  # services.udev.packages = [ pkgs.itsushi ];

}
