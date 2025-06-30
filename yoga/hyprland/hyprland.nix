{ pkgs, ... }:
{
 home.packages = with pkgs; [
    hyprland
    xdg-desktop-portal-hyprland
    hyprpaper
    brightnessctl
    grimblast
 ];

 wayland.windowManager.hyprland.enable = true;
}
