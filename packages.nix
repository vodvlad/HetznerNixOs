{ pkgs, ... }:

{
  # Системные пакеты
  environment.systemPackages = with pkgs; [
    vim
    wget
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
  programs.git = {
    enable = true;
    config = {
       user = {
          name = "Your Name";
          email = "you@example.com";
       };
    
       init = {
          defaultBranch = "main";
       };
    };
  };
  programs.starship.enable = true;
  programs.nix-ld.enable = true;

  # Установка ZSH как шелл по умолчанию
  users.defaultUserShell = pkgs.zsh;
}
