{ config, pkgs, unstablePkgs, lib, ... }:
let 
unstableInstalledPkgs = with unstablePkgs; [
  yandex-cloud
];
in 
{
  imports = [
    ./zellij.nix
    ./fish.nix
    ./git.nix
  ];

  home.username = "p.katunina";
  home.homeDirectory = "/Users/p.katunina";

  home.packages = with pkgs; [
    vim
    git
    coreutils
    colima
    curl 
    jq
    shellcheck
    opentofu
    wget
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
