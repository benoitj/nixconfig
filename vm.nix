{ config, pkgs, ... }:

{ 
  fileSystems."/media/host-home" = {
    device = "host-home";
    fsType = "vboxsf";
    options = ["uid=1000" "gid=100"];
  };
}
