{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./vim-config.nix
      ./users.nix
      ./services.nix
      ./packages.nix
    ];

  # Загрузчик GRUB
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; 

  # Сеть
  # networking.hostName = "nixos";
  # networking.networkmanager.enable = true;

  # Таймзона и локализация
  # time.timeZone = "Europe/Kyiv";
  # i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.05"; 
}
