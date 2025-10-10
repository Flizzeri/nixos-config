{ config, pkgs, ... }:

{
  home.username = "filippo";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/filippo" else "/home/filippo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  # ---- Shell & Prompt ----
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "fzf" "docker" "kubectl" "zoxide" ];
    };
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#workstation";
    };
  };

  programs.alacritty.enable = true;

  # ---- Editor ----
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      vimPlugins.nvim-treesitter
      vimPlugins.telescope-nvim
      vimPlugins.lualine-nvim
    ];
  };

  # ---- Dev Tools ----
  programs.git = {
    enable = true;
    userName = "F L";
    userEmail = "filippo.lizzeri@gmail.com";
  };

  home.packages = with pkgs; [
    python3
    nodejs
    go
    rustup
    docker-compose
    kubectl
    taskwarrior
    pass
    ripgrep
    fd
    bat
    fzf
    zoxide
    htop
  ];

  # ---- SSH Agent ----
  services.ssh-agent.enable = true;

  # ---- Dotfiles ----
  home.file = {
    ".gitconfig".text = ''
      [user]
        name = F L
        email = filippo.lizzeri@gmail.com
      [core]
        editor = nvim
    '';
  };
}
