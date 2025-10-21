{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    plugins = {
      autosuggestions.enable = true;
      syntax-highlighting.enable = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "docker" "zoxide" ];
    };
  };
}