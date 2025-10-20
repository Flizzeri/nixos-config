{
  description = "F L's NixOS + Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      # --- NixOS Configurations ---
      nixosConfigurations = {
        workstation = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/workstation/configuration.nix
            ./hosts/workstation/hardware-configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.filippo = import ./home/filippo.nix;
            }
          ];
        };
      };

      # --- Home Manager standalone (for macOS, etc.) ---
      homeConfigurations = {
        "filippo@macbook" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ ./home/filippo.nix ];
        };
      };
    };
}
