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
#     "docker"
      "iterm2"
      "visual-studio-code"
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono"]; })
  ];

  programs.fish.enable = true;
  users.users.pkatunina.shell = pkgs.fish;
  users.users.pkatunina.home = "/Users/pkatunina";
  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  system.stateVersion = 5;
}
