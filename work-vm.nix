{ config, pkgs, ... }:

{ imports = [ ./configuration.nix ./desktop.nix ./vm.nix ];
  networking.hostName = "work";
  environment.systemPackages = with pkgs; [
    git
  ];
}
