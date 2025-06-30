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
    awscli
    teleport
    vault
    tenv # terraform version management

   # programming
    go
    python3
  ] ++ unstableInstalledPkgs;
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

# standalone installation
  home.stateVersion = "24.05"; 
}
