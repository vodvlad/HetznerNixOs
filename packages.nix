{ pkgs, ... }:

{
  # Системные пакеты
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    btop
    neofetch
    docker-compose
  ];

  # Настройка ZSH и Starship
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "systemd" ];
    };
  };

  programs.starship.enable = true;
  programs.nix-ld.enable = true;

  # Установка ZSH как шелл по умолчанию
  users.defaultUserShell = pkgs.zsh;
}
