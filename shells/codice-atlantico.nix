{ pkgs }:
pkgs.mkShell {
  name = "codice-atlantico";
  packages = with pkgs; [
    go
    nodejs_20       # SvelteKit tooling requires Node
    pnpm
  ];
  shellHook = ''
    echo "[codice-atlantico] Go=$(go version) | Node=$(node -v)"
  '';
}
