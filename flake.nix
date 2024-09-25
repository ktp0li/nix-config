{
  description = "ktp0li's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgsUnstable, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import nixpkgsUnstable { system = system; config.allowUnfree = true; };

    in {
      homeConfigurations."p.katunina" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

# my work macbook m2
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          unstablePkgs = unstablePkgs;
        };
      };
    };
}
