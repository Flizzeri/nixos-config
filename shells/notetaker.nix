{ pkgs }:
pkgs.mkShell {
  name = "notetaker";
  packages = with pkgs; [
    python3
    python3Packages.virtualenv
    pipx
  ];
  shellHook = ''
    echo "[notetaker] Python=$(python3 --version)"
    echo "Tip: use 'python -m venv .venv && source .venv/bin/activate' for project isolation."
  '';
}
