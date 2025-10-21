{ config, pkgs, lib, ... }:

{
  home.username = "filippolizzeri";
  home.homeDirectory = "/Users/filippolizzeri";

  programs.home-manager.enable = true;

  imports = [
    ../modules/common/devtools.nix
    ../modules/common/terminal.nix
    ../modules/common/docker.nix
    ../modules/programs/neovim.nix
    ../modules/programs/zsh.nix
    ../modules/programs/tmux.nix
    ../modules/programs/alacritty.nix
    ../modules/services/ssh-agent.nix
  ];

  # Example: dotfiles you might want to link (optional)
  # home.file.".config/alacritty/alacritty.yml".source = ../dotfiles/alacritty.yml;

  # macOS vs Linux differences can be handled with mkIf if/when you add a Linux host.
  # For now, this stays portable.
  home.stateVersion = "24.05";
}