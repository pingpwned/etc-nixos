{ config, pkgs, ... }:

{
  # Enabling unfree packages, adding unstable channel and install latest python-trezor
  environment.interactiveShellInit = ''
    PS1="\[\033]2;\h:\u:\w\007\]\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\]";
   
    alias cdshop="cd ~/Develop/SHOPIFY/sl-shopify"
    '';

}
