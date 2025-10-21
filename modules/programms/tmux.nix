{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a";
    terminal = "screen-256color";
    extraConfig = ''
      set -g mouse on
      setw -g mode-keys vi
    '';
  };
}
