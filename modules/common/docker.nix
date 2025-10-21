{ pkgs, lib, ... }:

{
  # Docker CLI + Compose. On macOS this talks to Docker Desktop or Colima.
  home.packages = with pkgs; [
    docker
    docker-compose
  ];
}
