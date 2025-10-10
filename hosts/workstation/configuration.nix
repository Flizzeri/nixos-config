{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "25.05";  # match your installer version
  networking.hostName = "workstation";
  time.timeZone = "Europe/Rome";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Desktop Environment
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  # Networking
  networking.networkmanager.enable = true;

  # User
  users.users.filippo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    git
    docker
    docker-compose
    kubectl
    proxmox-backup-client
    google-chrome
    vscode
    musescore
    python3
    nodejs
    go
    rustup
    alacritty
    neovim
    tmux
    pass
    openssh
    taskwarrior
    fzf
    ripgrep
    fd
    bat
    zoxide
    htop
  ];

  # Enable zsh
  programs.zsh.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless.enable = true;

  # SSH
  services.openssh.enable = true;

  # Allow unfree software (for Chrome, VSCode, etc.)
  nixpkgs.config.allowUnfree = true;

  # Enable flakes + nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
