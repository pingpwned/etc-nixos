{ config, pkgs, ... }:
let
 statsConfig = {
    db = "root";
    user = "wp_root";
    password = "wp_root_password";
  };
in
{
  services.nginx = {
    enable = true;
    user = "www-data";
    group = "www-data";
    virtualHosts."local.test" = {
      root = "/srv/www";
      #locations."/".extraConfig = ''
      #  try_files $uri $uri/ /index.php; index index.php;
      #'';

      extraConfig = ''
        index index.php;
        # Rewrite rules for WordPress Multi-site.
        if (!-e $request_filename) {
          #rewrite /wp-admin$ $scheme://$host$uri/ permanent;
          rewrite ^/[_0-9a-zA-Z-]+(/wp-.*) $1 last;
          rewrite ^/[_0-9a-zA-Z-]+(/.*\.php)$ $1 last;
        }
 
      '';
      locations."~ \.php$".extraConfig = ''
        fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
        fastcgi_index index.php;
        try_files $uri $uri/ /index.php; index index.php;
     '';


      locations."~ /.ht".extraConfig = ''
        deny all;
      '';

      locations."~ /.well-known".extraConfig = ''
        allow all;
      '';

      locations."/adminer".extraConfig = ''
        index adminer.php;
      '';

    };
  };
  
 services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    bind = "localhost";
    ensureDatabases = [
      statsConfig.db
    ];
    ensureUsers = [
      {
        name = "${statsConfig.user}";
        ensurePermissions = {
          "${statsConfig.db}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };

   systemd.services.setdbpass = {
    description = "MySQL database password setup";
    wants = [ "mysql.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = ''
      ${pkgs.mariadb}/bin/mysql -e "grant all privileges on ${statsConfig.db}.* to ${statsConfig.user}@localhost identified by '${statsConfig.password}';" ${statsConfig.db}
      '';
      User = "root";
      PermissionsStartOnly = true;
      RemainAfterExit = true;
    };
  };


  services.phpfpm.pools.mypool = {
    user = "nobody";
    settings = {
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
    };
  };
  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
