{ pkgs, lib, ... }:
{
   nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];


  home.packages = with pkgs; [
    vscode
  ];

  programs.vscode.enable = true;
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-python.python
    arcticicestudio.nord-visual-studio-code
    ecmel.vscode-html-css
  ];
}
