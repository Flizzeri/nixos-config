{ pkgs, lib, ... }:

{
  programs.ssh.enable = true;

  # Enable ssh-agent only on Linux, skip on macOS (Darwin)
  services.ssh-agent.enable = lib.mkIf (pkgs.stdenv.isLinux) true;
}