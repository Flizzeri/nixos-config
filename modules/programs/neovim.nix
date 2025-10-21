{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = false; # keep minimal; add if you need treesitter compilers
    extraPackages = with pkgs; [ ];
  };
}
