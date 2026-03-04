{
  description = "MyConfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        constants = {
          username = "vladyslav";
          email = "you@example.com";
          gitName = "Your Name";
          timezone = "Europe/Luxembourg";
        };
      };
      modules = [ ./configuration.nix ]; # Импорт вашего основного файла
    };
  };
}
