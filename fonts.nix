{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
    twitter-color-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "SourceCodePro" ]; })
    powerline-fonts
    symbola
  ];
  fonts.fontconfig = {
   # localConf = ''
   #   <fontconfig>
   #     <alias>
   #       <family>sans-serif</family>
   #       <prefer>
   #         <family>Noto Sans</family>
   #         <family>Noto Color Emoji</family>
   #         <family>Noto Emoji</family>
   #         <family>DejaVu Sans</family>
   #       </prefer> 
   #     </alias>
   #    
   #     <alias>
   #       <family>serif</family>
   #       <prefer>
   #         <family>Noto Serif</family>
   #         <family>Noto Color Emoji</family>
   #         <family>Noto Emoji</family>
   #         <family>DejaVu Serif</family>
   #       </prefer>
   #     </alias>
   #    
   #     <alias>
   #      <family>monospace</family>
   #      <prefer>
   #        <family>Noto Mono</family>
   #        <family>Noto Color Emoji</family>
   #        <family>Noto Emoji</family>
   #        <family>DejaVu Sans Mono</family>
   #       </prefer>
   #     </alias>
   #    </fontconfig>
   # '';
    #defaultFonts.emoji = ["NotoEmoji"];
  };
}
