{
  description = "ktp0li's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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

  outputs = { nixpkgs, nixpkgsUnstable, home-manager, nix-colors, nixos-hardware, nix-darwin, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import nixpkgsUnstable { system = system; config.allowUnfree = true; };

    in {
      # my personal thinkpad x1 yoga gen 6
      nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./yoga/configuration.nix
          ./yoga/hardware-configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-yoga
          home-manager.nixosModules.home-manager
          {
            home-manager.users.ktp0li = {
              imports = [ ./yoga/default.nix ];
            #   home.username = "ktp0li";
            #   home.homeDirectory = "/home/ktp0li";
            #   home.stateVersion = "23.11";
            };
            home-manager.extraSpecialArgs = {
              inherit nix-colors;
            };
          }
        ];
      };
      # my work macbook m3 pro
      darwinConfigurations."mbp-pkatunina-OZON-MDYQ17TY23" = nix-darwin.lib.darwinSystem {
        inherit pkgs;

        modules = [
          ./mac/configuration.nix
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
            home-manager.users.pkatunina = import ./mac/home.nix;
            home-manager.extraSpecialArgs = {
              unstablePkgs = unstablePkgs;
            };
          }
        ];
      };
    };
}
