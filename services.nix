{ config, pkgs, ... }:

{
  # Docker
  virtualisation.docker.enable = true;

  # SSH Daemon
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  # Безопасность
  services.fail2ban.enable = true;

  # Автоматическая очистка хранилища Nix
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
