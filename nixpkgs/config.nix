{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    # permittedInsecurePackages = [
    #   "thunderbird-68.12.0"
    # ];
  };
}
