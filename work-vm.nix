{ config, pkgs, ... }:

{ imports = [
    ./configuration.nix
    ./desktop.nix
    ./tools.nix
    ./vm.nix ];
  networking.hostName = "work";
  environment.systemPackages = with pkgs; [
    git
  ];
}
