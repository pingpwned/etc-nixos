{ config, pkgs, ... }:

{

  imports = [
    ./vi.nix
    ./programs.nix
    ./interactiveShellInit.nix
    ./sessionVariables.nix
    ./users.nix
  ];	
  
  # System-wide packages
  environment.systemPackages = with pkgs; [ 
    rxvt-unicode wget git libfido2
    wireguard
  ];

}
