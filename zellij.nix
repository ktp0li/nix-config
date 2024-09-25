{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "nord";
      default_layout = "compact";
    };
  };
}