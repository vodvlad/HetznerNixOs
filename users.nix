{ pkgs, ... }:

{
  users.users.${constatns.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDF9bxfqxpCy0shBHFOFKMbxmwuJwYt1OV25lY/lhIsXlO8u3cNU7GU5GFKn/+ERLEWzBjcVRaakf0tjpT6p6NEeuc+aLpilckywHnUIPfdVqI6j1AfMKLiiSZGjK0R5Z1nbLIrkNVUr5XQigZApkp74I1CDcMp9yM54aIYlRasNKM20W3zkQnadk8lSmZlKtg//Xp7pZ774yyyISgxp7K59rCH2vq3l1cWqJtlKRJpeB2Hl6dLK2kqwI3gRLWV+X3KjwhSViUvPJnLzAqEStV1KmY+A3QcfrX5rvv8IiezvOXDxCjpNJGaLWzRwGXaB8hQaH+v6UfawJNcjHdrgli4lwDSo6D+QZY6MiqitEZnZ5vZurCNgDPlTKzba7YCMf2I3yGZ/pYpnEkVj1VTc3RaZ3RcjV3XOayE6iwj5JX754L76GfEF8wnLdlL8dgnU9jyVcv2IvY8wFyVCPGKGMWuOtbJ4Ttn+1JdEd9lKNDcmsu7bUtAySlWUsmXOwrx9Gk= vladyslavvodopianov@Vladislavs-MacBook-Air.local"
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDF9bxfqxpCy0shBHFOFKMbxmwuJwYt1OV25lY/lhIsXlO8u3cNU7GU5GFKn/+ERLEWzBjcVRaakf0tjpT6p6NEeuc+aLpilckywHnUIPfdVqI6j1AfMKLiiSZGjK0R5Z1nbLIrkNVUr5XQigZApkp74I1CDcMp9yM54aIYlRasNKM20W3zkQnadk8lSmZlKtg//Xp7pZ774yyyISgxp7K59rCH2vq3l1cWqJtlKRJpeB2Hl6dLK2kqwI3gRLWV+X3KjwhSViUvPJnLzAqEStV1KmY+A3QcfrX5rvv8IiezvOXDxCjpNJGaLWzRwGXaB8hQaH+v6UfawJNcjHdrgli4lwDSo6D+QZY6MiqitEZnZ5vZurCNgDPlTKzba7YCMf2I3yGZ/pYpnEkVj1VTc3RaZ3RcjV3XOayE6iwj5JX754L76GfEF8wnLdlL8dgnU9jyVcv2IvY8wFyVCPGKGMWuOtbJ4Ttn+1JdEd9lKNDcmsu7bUtAySlWUsmXOwrx9Gk= vladyslavvodopianov@Vladislavs-MacBook-Air.local"
  ];
}
