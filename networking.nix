{ config, pkgs, ... }:

{
  networking = {
    hostName = "lammabuk";
    networkmanager = {
      enable = true;
    };
    nameservers = [ "8.8.8.8" "8.8.4.4" ];

  # Enable NAT for containers
  nat.enable = false;
  # nat.internalInterfaces = ["ve-+"];
  # nat.externalInterface = "wlp2s0";
  # networkmanager.unmanaged = [ "interface-name:ve-*" ];
  # Open ports in the firewall.
  # firewall.allowedTCPPorts = [ ... ];
  # firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # firewall.enable = false;
  extraHosts =
    ''
      127.0.0.1 local.example.com
    '';

  # Enable wireless support via wpa_supplicant.
  # wireless.enable = true;  

  # Configure network proxy if necessary
  # proxy.default = "http://user:password@proxy:port/";
  # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  };
}
