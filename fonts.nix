{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
#    fira-code
#    fira-code-symbols
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    mplus-outline-fonts
    dina-font
    proggyfonts
  ];
  fonts.fontconfig.defaultFonts.emoji = ["NotoEmoji"];
}
