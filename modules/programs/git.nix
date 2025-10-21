{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "Filippo Lizzeri";
    userEmail = "filippo.lizzeri@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
