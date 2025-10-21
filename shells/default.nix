{ pkgs }:
{
  afterdark = import ./afterdark.nix { inherit pkgs; };
  codice-atlantico = import ./codice-atlantico.nix { inherit pkgs; };
  notetaker = import ./notetaker.nix { inherit pkgs; };
}
