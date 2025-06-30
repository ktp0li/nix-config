{ ... }:
{
  imports = [ (import ./hyprland) ]
    ++ [ (import ./waybar) ]
    ++ [ (import ./gtk.nix) ]
    ++ [ (import ./fish.nix) ]
    ++ [ (import ./foot.nix) ]
    ++ [ (import ./packages.nix) ]
    ++ [ (import ./env.nix) ]
    ++ [ (import ./hyprpaper.nix) ]
    ++ [ (import ./colorsheme.nix ) ]
    ++ [ (import ./hypridle.nix) ]
    ++ [ (import ./rofi) ]
    ++ [ (import ./swaylock.nix) ]
    ++ [ (import ./zellij.nix) ]
    ++ [ (import ./vscode.nix) ];
}
