{ config, lib, pkgs, ... }:
let 
  hexToRgb = hexstring:
    let
      hexx = lib.strings.match "([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})" hexstring;
      values = map (s: (builtins.fromTOML "a = 0x${s}").a) hexx;
    in
    {
      r = toString (builtins.elemAt values 0);
      g = toString (builtins.elemAt values 1);
      b = toString (builtins.elemAt values 2);
    };

    clock_color = hexToRgb(config.colorScheme.palette.base04);
    input_color = hexToRgb(config.colorScheme.palette.base00);
    input_text_color = hexToRgb(config.colorScheme.palette.base03);
in {
  home.packages = with pkgs; [
    hyprlock
  ];

  programs.hyprlock.enable = true;

  programs.hyprlock.settings = {
    background = {
      monitor = "";
      path = "~/.bg/bed_2x.png";
      blur_passes = 0;
    };

    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = true;
    };

    input-field = {
      monitor = "";
      size = "250, 60";
      outline_thickness = 2;
      dots_size = 0.2; # scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true;
      outer_color = "rgba(0, 0, 0, 0)";
      inner_color = "rgb(${input_color.r}, ${input_color.g}, ${input_color.b})";
      font_color = "rgb(${input_text_color.r}, ${input_text_color.g}, ${input_text_color.b})";
      fade_on_empty = false;
      font_family = "JetBrains Mono Nerd Font Mono";
      #placeholder_text = "<span foreground=\"##cdd6f4\">Input Password...</span>";
      placeholder_text = "Input Password...";
      hide_input = false;
      position = "0, -120";
      halign = "center";
      valign = "center";
    };

      label = [
      {
         monitor = "";
         text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
         color = "rgb(${clock_color.r}, ${clock_color.g}, ${clock_color.b})";
         font_size = 120;
         font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
         position = "0, -300";
         halign = "center";
         valign = "top";
       }

# USER
       {
         monitor = "";
         text = "Hi there, $USER";
         color = "rgb(${clock_color.r}, ${clock_color.g}, ${clock_color.b})";
         font_size = 25;
         font_family = "JetBrains Mono Nerd Font Mono";
         position = "0, -40";
         halign = "center";
         valign = "center";
       }
    ];
  };
}
