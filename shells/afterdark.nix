{ pkgs }:
pkgs.mkShell {
  name = "afterdark";
  packages = with pkgs; [
    nodejs_20       # includes npm
    pnpm            # optional but common
  ];
  shellHook = ''
    echo "[afterdark] Node toolchain ready (node=$(node -v))"
  '';
}
