{
  description = "Filippo Lizzeri's configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        ######################################
        ## DEV SHELLS (per system)
        ######################################
        devShells = {
          afterdark = import ./shells/afterdark.nix { inherit pkgs; };
          codice-atlantico = import ./shells/codice-atlantico.nix { inherit pkgs; };
          notetaker = import ./shells/notetaker.nix { inherit pkgs; };
        };
      }
    ) //
    ######################################
    ## NON-SYSTEM OUTPUTS (NixOS + Darwin)
    ######################################
    {
      nixosConfigurations = {
        workstation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/workstation/configuration.nix
            ./modules/common
          ];
        };
      };

      darwinConfigurations = {
        macbook-x86_64 = nix-darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./hosts/macbook/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.filippolizzeri = import ./home/filippo.nix;
            }
          ];
        };

        macbook-aarch64 = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/macbook/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.filippolizzeri = import ./home/filippo.nix;
            }
          ];
        };
      };
    };
}
