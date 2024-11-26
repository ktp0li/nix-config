{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = false;
    enableFishIntegration = true;
    settings = {
      theme = "nord";
      default_layout = "compact";
    };
  };
}
