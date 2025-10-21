{ config, pkgs, ... }:

{
  # Determinate Systems manages Nix, so disable nix-darwin’s internal control.
  nix.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # macOS shell
  programs.zsh.enable = true;

  # Define your actual macOS user (match `whoami`)
  users.users.filippolizzeri = {
    name = "filippolizzeri";
    home = "/Users/filippolizzeri";
  };

  # Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Simplify default Darwin features
  documentation.enable = false;
  system.stateVersion = 5;
}
