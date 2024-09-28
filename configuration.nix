{ pkgs, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "hiddenbar"
    ];
  };

  programs.fish.enable = true;
  users.users."p.katunina".shell = pkgs.fish;
  users.users."p.katunina".home = "/Users/p.katunina";
  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  system.stateVersion = 5;
}