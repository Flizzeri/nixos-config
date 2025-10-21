{ pkgs }:
pkgs.mkShell {
  name = "notetaker";
  packages = with pkgs; [
    python3
    python3Packages.virtualenv
    pipx
  ];
  shellHook = ''
      PROJECT_DIR="$HOME/Documents/projects/notetaker"

    if [ -d "$PROJECT_DIR" ]; then
      cd "$PROJECT_DIR"
      echo "[notetaker] cd into $PROJECT_DIR"
      if command -v code >/dev/null 2>&1; then
        code . >/dev/null 2>&1 &
        echo "[notetaker] opened in VS Code"
      else
        echo "[notetaker] VS Code not found; skipping"
      fi
    else
      echo "[notetaker] directory not found: $PROJECT_DIR"
    fi

    echo "[notetaker] Python=$(python3 --version)"
    echo "Tip: use 'python -m venv .venv && source .venv/bin/activate' for project isolation."
  '';
}
