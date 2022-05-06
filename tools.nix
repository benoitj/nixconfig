{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    aspellDicts.fr
    atool
    autoconf
    automake
    bash-completion
    bc
    bind
    binutils
    bluez
    bluez-tools
    bsdgames
    cargo
    chezmoi
    clang
    clj-kondo
    clojure
    cmake
    cowsay
#     ;; TODO docker 1:20.10.7-1
#     ;; TODO docker-compose 1.29.2-1
    dos2unix
    fd
    feh
    gcc
    ghc
    git
    git-annex
    git-doc
    git-hub
    git-stree
    go
    goimapnotify
    gopls
    gnupg
    graphviz
    gimp
    keepassxc
    leiningen
    libmediainfo
    libreoffice
    lynx
    maim
    gnumake
    maven
    #mpv
    mupdf
    nix-bash-completions
    #nss-cacerts
    jdk11
    pass
    plantuml
    poppler
    python39Full
    python39Packages.tldextract
    ruby
    rustc
    tesseract4
    html-tidy
    sqlite
    strace
    surfraw
    sxiv
#     "syncthing" # move to personal laptop
    vim
    w3m
    wget
    wordnet
#    zathura
     #zathura-pdf-mupdf
     #zathura-djvu

  ];

  virtualisation.docker.enable = true;

}
