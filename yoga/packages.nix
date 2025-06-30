{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    neovim
    wl-clipboard # wayland clipboard tool
    telegram-desktop
    git
    nil # lsp for nix
    nordic # gtk nord theme
    libqalculate # calculator

    # tools for audio management
    pavucontrol
    pamixer

    blender
  ];

  programs.nix-index.enable = true;
}

