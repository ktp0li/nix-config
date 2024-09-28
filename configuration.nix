{ pkgs, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "hiddenbar" # <- hide icons in dock
      "shottr" # <- screenshot tool
      "domzilla-caffeine" # <- don't let mac fall asleep
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono"]; })
  ];

  programs.fish.enable = true;
  users.users."p.katunina".shell = pkgs.fish;
  users.users."p.katunina".home = "/Users/p.katunina";
  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  system.stateVersion = 5;
}