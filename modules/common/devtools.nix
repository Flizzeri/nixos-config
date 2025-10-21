{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    fzf
    ripgrep
    fd
    bat
    zoxide
    htop
    go-task
  ];
}
