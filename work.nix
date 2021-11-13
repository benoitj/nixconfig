{ config, pkgs, ... }:

{ imports = [ ./configuration.nix ];
  networking.hostName = "work";
  environment.systemPackages = with pkgs; [
    git
  ];

  fileSystems."/media/host-home" = {
    device = "host-home";
    fsType = "vboxsf";
    options = ["uid=1000" "gid=100"];
  };
}
