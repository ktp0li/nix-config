{ ... }:
{
  imports = [ (import ./hyprland.nix) ]
    ++ [ (import ./settings.nix) ];
}
