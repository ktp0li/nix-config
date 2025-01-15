{ config, pkgs, unstablePkgs, lib, ... }:
let 
unstableInstalledPkgs = with unstablePkgs; [
  yandex-cloud
  opentofu
];
in 
{
  imports = [
    ./zellij.nix
    ./fish.nix
    ./git.nix
  ];

  home.username = "pkatunina";
  home.homeDirectory = "/Users/pkatunina";

  home.packages = with pkgs; [
    # basic utils
    vim
    git
    coreutils
    curl 
    jq
    wget
    darwin.iproute2mac # ip util wrapper for macos
    libqalculate # advanced calculator

    # devops tools
    shellcheck
    colima
    awscli
    teleport

   # programming
    go
  ] ++ unstableInstalledPkgs;

  home.sessionVariables = {
    EDITOR = "vim";
  };

# yandex mirrors for yc terraform provider
  home.file.".tofurc" = {
    text = ''
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.opentofu.org/*/*"]
  }
  direct {
    exclude = ["registry.opentofu.org/*/*"]
  }
}   
    '';
  };

# standalone installation
  home.stateVersion = "24.05"; 
}
