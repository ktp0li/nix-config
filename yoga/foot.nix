{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
  foot
  ];

 programs.foot.enable = true;
 programs.foot.settings = {
   main = {
     font = "JetBrains Mono:size=13";
   };
   cursor = {
     #color = "2e3440 d8dee9";
     color = "${config.colorScheme.palette.base00} ${config.colorScheme.palette.base04}";
   };
   colors = {
     alpha = 0.7;
     foreground = config.colorScheme.palette.base04;
     background = config.colorScheme.palette.base00;

     regular0 = config.colorScheme.palette.base01;
     regular1 = config.colorScheme.palette.base08;
     regular2 = config.colorScheme.palette.base0B;
     regular3 = config.colorScheme.palette.base07;
     regular4 = config.colorScheme.palette.base0D;
     regular5 = config.colorScheme.palette.base0E;
     regular6 = config.colorScheme.palette.base0C;
     regular7 = config.colorScheme.palette.base05;

     bright0 = config.colorScheme.palette.base03;
     bright1 = config.colorScheme.palette.base08;
     bright2 = config.colorScheme.palette.base0B;
     bright3 = config.colorScheme.palette.base0A;
     bright4 = config.colorScheme.palette.base0D;
     bright5 = config.colorScheme.palette.base0E;
     bright6 = config.colorScheme.palette.base07;
     bright7 = config.colorScheme.palette.base06;

#     foreground = "d8dee9";
#     background = "2e3440";
#
#     regular0 = "3b4252";
#     regular1 = "bf616a";
#     regular2 = "a3be8c";
#     regular3 = "ebcb8b";
#     regular4 = "81a1c1";
#     regular5 = "b48ead";
#     regular6 = "88c0d0";
#     regular7 = "e5e9f0";
#
#     bright0 = "4c566a";
#     bright1 = "bf616a";
#     bright2 = "a3be8c";
#     bright3 = "ebcb8b";
#     bright4 = "81a1c1";
#     bright5 = "b48ead";
#     bright6 = "8fbcbb";
#     bright7 = "eceff4";
#     dim0 = "373e4d";
#     dim1 = "94545d";
#     dim2 = "809575";
#     dim3 = "b29e75";
#     dim4 = "68809a";
#     dim5 = "8c738c";
#     dim6 = "6d96a5";
#     dim7 = "aeb3bb";
   };
 };
}
