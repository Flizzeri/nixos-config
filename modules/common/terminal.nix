{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
  ];

  # Make zoxide, fzf etc. available in shells automatically
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
}
