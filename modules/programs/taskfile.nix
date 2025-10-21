{ pkgs, ... }:
{
  # Taskfile (go-task)
  home.packages = with pkgs; [ go-task ];
}
