# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.autorun = true; # start with: systemctl start display-manager.service
  services.dwm-status.enable = true;
  services.dwm-status.order = ["battery" "network" "audio" "time"];
 
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
#  services.xserver.libinput.touchpad.disableWhileTyping = true;
  services.xserver.synaptics.enable = false;

  environment.systemPackages = with pkgs; [
    alsaPlugins 
    alsaTools
    alsaUtils
    apulse
    arandr
    autorandr
    cantarell-fonts
    cmake
    compton
    dragon-drop
    dunst
    dwm
    dwm-status
    #emacsGcc
    firefox
    gcc
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    libnotify
    libtool
    libvterm-neovim
    mate.mate-polkit
    mpc_cli
    pamixer
    pulsemixer
    #qutebrowser
    ranger
    rofi
    st
    unclutter
    #vivaldi-widevine
    wmctrl
    xclip
    xdg-user-dirs
    xdotool
    xsel
    brightnessctl
    xorg.xev

#     "fontconfig"
#     "font-adobe-source-code-pro"
#     "font-dejavu"
#     "font-google-noto"
#     "font-abattis-cantarell"
#     "font-openmoji"
#     "libnotify"
#     "mate-polkit"
#     "wmctrl"
#     "xdg-utils"
#     "xdg-user-dirs"
#     "xdotool"
#     "xrdb"
#     "xsel"

  ];

  #services.emacs.package = pkgs.emacsPgtkGcc;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
       src = super.fetchFromGitHub {
         owner = "benoitj";
         repo = "dwm";
         rev = "af08c7384f3fad6be5ba02d6fa678cb7914c33dd";
         sha256 = "011pk4rh66ish179kc2qjl1dx2gs0q4c0wxp9c97aifi6ppawljm";
       };
      });
    st = super.st.overrideAttrs (oldAttrs: rec {
       src = super.fetchFromGitHub {
         owner = "benoitj";
         repo = "st";
         rev = "main";
         sha256 = "1kixba8bxkc1812mn4cik6865qazpm0wiv7484j8n97l2cyagq84";
       };
      });
    })
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      ref = "master";
      rev = "f01c9352ea15574602234feea5b4dc25df26a77a"; # change the revision
    }))
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    cantarell-fonts
  ];
}

