{ config, pkgs, ... }:

{ 
  fileSystems."/media/host" = {
    device = "host-home";
    fsType = "vboxsf";
    options = ["uid=1000" "gid=100"];
  };
}
