## this file contains profile of a host
{ config, pkgs, lib, ... }:
{
  ## host specific variables
  networking.hostName = "app1.example";
  networking.firewall.allowPing = true;
  imports = [ 
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
    ./vi.nix
  ];
  boot.loader.grub.device = "/dev/vda";
  fileSystems."/" = { device = "/dev/vda1"; fsType = "ext4"; };
  networking = {
    nameservers = [
      ""
      ""
    ];
    defaultGateway = "";
    defaultGateway6 = "";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address = ""; prefixLength = 20; }
          { address = ""; prefixLength = 16; }
        ];
        ipv6.addresses = [
          { address = "0::0:f:f:8"; prefixLength = 64; }
        ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}==":ca::::", NAME="eth0"
  '';

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    passwordAuthentication = lib.mkDefault false;
  };

  users.extraUsers.root.openssh.authorizedKeys.keys = lib.mkDefault [ "AAAAAAAAAAAAAA==" ];

  users.users.root.hashedPassword = "";
  users.users.dsavinykh = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ "AAAA="]; 
  };

  # packages relevant for all systems
  environment.systemPackages = with pkgs; [
    htop
    screen
    # vim Use custom vim config instead /etc/nixos/vim.nix
    wget
    unzip
    docker-compose 
    git 
    yarn 
    nodejs-12_x 
  ];

  # Keeping the journald under 500M
  services.journald.extraConfig = "SystemMaxUse=500M";

  services.cron.enable = true;
  # spam until tested
  services.cron.mailto = "name@example";

  # Auto optimize the nix store
  nix.autoOptimiseStore = true;

  # Firewall settings
  networking.firewall.allowedTCPPorts = [ 22 80 443 3000 3001 9100 ];

  virtualisation.docker = {
    enable = true;
  };

  # Static Web server configuration - Nginx
  #services.nginx = {
  #  enable = true;
  #  virtualHosts."app1.example.." = {
  #    enableACME = true;
  #    forceSSL = true;
  #    root = "/var/www/app1";
  #  };
  #};
  # Optional: You can configure the email address used with Let's Encrypt.
  # This way you get renewal reminders (automated by NixOS) as well as expiration emails.
  #security.acme.certs = {
  #  "app1.example.. = "name@example.com";
  #};

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    # other Nginx options
#    virtualHosts."name.app1.example.." = {
#      enableACME = true;
#      acmeRoot = "/var/www/challenges";
#      forceSSL = true;
#      root = "/var/www/app1.example..";
#    };
    virtualHosts."app1.example.." =  {
      enableACME = true;
      acmeRoot = "/var/www/challenges";
      forceSSL = true;
      locations."/" = {
          proxyPass = "http://127.0.0.1:3000";
          proxyWebsockets = false; # needed if you need to use WebSocket
          extraConfig = ''
            # required when the target is also TLS server with multiple hosts
            proxy_ssl_server_name on;
            # required when the server wants to use HTTP Authentication
            proxy_pass_header Authorization;
          '';
      };
    };
  };

  # SSL config
  security.acme = {
    acceptTerms = true;
    email = "";
  };
  # MongoDB
  services.mongodb = {
    enable = false;
  #  # If you need specific version of MongoDB package:
  #  #package = pkgs.mongodb-4_0;
  #  enableAuth = true;
  #  initialRootPassword = "";
  #  initialScript = "/home/dev/init-mongo.js";
  };
}

