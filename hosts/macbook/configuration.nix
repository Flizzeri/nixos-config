{ config, pkgs, ... }:

{
  # Enable flakes and the new CLI on macOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.enable = false;

  # Use zsh as the login shell on macOS
  programs.zsh.enable = true;

  # Define the local user (adjust if needed)
  users.users.filippolizzeri = {
    name = "filippolizzeri";
    home = "/Users/filippolizzeri";
  };

  # Reasonable defaults
  security.pam.services.sudo_local.touchIdAuth = true;

  # Keep the system relatively quiet
  documentation.enable = false;
  system.stateVersion = 5; # Darwin module format version (not macOS version)
}
