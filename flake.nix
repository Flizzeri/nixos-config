{
  description = "Filippo’s Nix environments (macOS via nix-darwin, plus portable dev shells)";

  inputs = {
    nixpkgs.url       = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url  = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url    = "github:LnL7/nix-darwin";
    flake-utils.url   = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, flake-utils, ... }:
    let
      # Helper to make shells available on all common systems
      perSystem = flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          devShells = import ./shells { inherit pkgs; };
        });

    in
    perSystem // {
      darwinConfigurations = {
        macbook-x86_64 = nix-darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./hosts/macbook/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.filippo = import ./home/filippo.nix;
            }
          ];
        };
      };
    };
}
