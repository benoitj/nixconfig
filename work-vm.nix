{ config, pkgs, ... }:

{ imports = [ ./configuration.nix ./vm.nix ];
  networking.hostName = "work";
  environment.systemPackages = with pkgs; [
    git
  ];
}
