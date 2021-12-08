{ config, pkgs, ... }:

{ imports = [
    ./configuration.nix
    ./desktop.nix
    ./tools.nix];
  networking.hostName = "milhouse";
  environment.systemPackages = with pkgs; [
    git
    pinentry-gtk2
    yubikey-manager
  ];

  services.pcscd.enable = true;
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
  };
  
}
