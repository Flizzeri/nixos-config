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

  home.file.".ssh/config".source = ../dotfiles/ssh/config;
  
  home.stateVersion = "24.05";
}