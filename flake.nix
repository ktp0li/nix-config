{
  description = "ktp0li's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = { nixpkgs, nixpkgsUnstable, home-manager, nix-darwin, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import nixpkgsUnstable { system = system; config.allowUnfree = true; };

    # my work macbook m3 pro
    in {
      darwinConfigurations."mbp-pkatunina-OZON-MDYQ17TY23" = nix-darwin.lib.darwinSystem {
        inherit pkgs;

        modules = [
          ./configuration.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
          nix-homebrew = {
            enable = true;

            enableRosetta = false;

            # User owning the Homebrew prefix
            user = "pkatunina";

            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
              };

              mutableTaps = false;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.users.pkatunina = import ./home.nix;
            home-manager.extraSpecialArgs = {
              unstablePkgs = unstablePkgs;
            };
          }
        ];
      };
    };
}
