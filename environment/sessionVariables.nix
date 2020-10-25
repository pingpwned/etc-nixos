{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    TERMINAL = [ "urxvt" ];
  };
}
