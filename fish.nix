{ config, pkgs, ... }:
{
# fish is set to default shell via chsh -s ~/.nix-profile/bin/fish
  home.packages = with pkgs; [
    fish
    grc
    fishPlugins.grc
    zoxide
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      zoxide init fish | source
      alias cd z
    '';
    plugins = [
      {name = "grc"; src = pkgs.fishPlugins.grc;}
      {
        name = "tide";
        src = pkgs.fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "a34b0c2809f665e854d6813dd4b052c1b32a32b4";
          sha256 = "sha256-ZyEk/WoxdX5Fr2kXRERQS1U1QHH3oVSyBQvlwYnEYyc=";
        };
      }
    ]; 
  };
}