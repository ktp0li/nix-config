{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-wayland-unwrapped
  ];

  home.file.".config/rofi/config.rasi" = {
      text = ''
configuration {
 modi: "drun,run,ssh";
 show: "drun";
 drun-display-format: "{name}";
 font: "Jetbrains Mono 13";
 }
@import "~/.config/rofi/theme.rasi"
  '';
};
}
