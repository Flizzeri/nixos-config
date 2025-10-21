{ pkgs }:
pkgs.mkShell {
  name = "afterdark";
  packages = with pkgs; [
    nodejs_20       # includes npm
    pnpm            # optional but common
  ];
  shellHook = ''
    PROJECT_DIR="$HOME/Documents/projects/Afterdark"

    if [ -d "$PROJECT_DIR" ]; then
      cd "$PROJECT_DIR"
      echo "[afterdark] cd into $PROJECT_DIR"
      if command -v code >/dev/null 2>&1; then
        code . >/dev/null 2>&1 &
        echo "[afterdark] opened in VS Code"
      else
        echo "[afterdark] VS Code not found; skipping"
      fi
    else
      echo "[afterdark] directory not found: $PROJECT_DIR"
    fi

    echo "[afterdark] Node toolchain ready (node=$(node -v))"
  '';
}
