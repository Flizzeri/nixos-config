{ config, pkgs, ... }:

{
  # Enable flakes and the new CLI on macOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # nix-daemon for multi-user installs (recommended on macOS)
  services.nix-daemon.enable = true;

  # Use zsh as the login shell on macOS
  programs.zsh.enable = true;

  # Define the local user (adjust if needed)
  users.users.filippo = {
    name = "filippo";
    home = "/Users/filippo";
  };

  # Reasonable defaults
  security.pam.enableSudoTouchIdAuth = true;

  # Keep the system relatively quiet
  documentation.enable = false;
  system.stateVersion = 5; # Darwin module format version (not macOS version)
}
