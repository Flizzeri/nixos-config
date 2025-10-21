{ pkgs, ... }:
{
  # On macOS this provides Docker CLI and Compose v2.
  # You still need a backend: Docker Desktop or colima.
  home.packages = with pkgs; [
    docker
    docker-compose
  ];
}
