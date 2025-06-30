{ ... }:
{
  imports = [ (import ./settings.nix) ]
    ++ [ (import ./waybar.nix) ]
    ++ [ (import ./style.nix) ];
}
