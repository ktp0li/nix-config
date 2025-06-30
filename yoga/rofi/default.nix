{ ... }:
{
  imports = [ (import ./style.nix) ]
    ++ [ (import ./rofi.nix)];
}
