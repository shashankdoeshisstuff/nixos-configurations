# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  users.users.moon = {
    isNormalUser = true;
    description = "Shashank Maurya";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # packages
      lutris
      qbittorrent
      vlc
      # internet
      librewolf
      firefox
      # devlopment
      #postman
      vscode
      # tools for productivity
      inkscape
      libreoffice
      libsForQt5.kdenlive
      obs-studio
      # for gnome
      # packages
      gnome.gnome-tweaks
      gnome.gnome-shell-extensions
      # gnome extensions
      gnomeExtensions.dash-to-panel
      gnomeExtensions.pano
      gnomeExtensions.vitals
      gnomeExtensions.rounded-window-corners
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.forge
      # themes
      orchis-theme
      tela-icon-theme
      tela-circle-icon-theme
      numix-cursor-theme
      graphite-cursors
      bibata-cursors
    ];
  };
  
  environment.systemPackages = with pkgs; [
    # packages
    sticky
    git
    sassc
    flatpak
    # python packages
    python3
    pipx
    python311Packages.pip
    python311Packages.flask
    # node package
    nodejs
    nodePackages.json-server
    nodePackages.nodemon
  ];
  
  #fonts
  fonts.packages = with pkgs; [
    cascadia-code
  ];
  
  services.flatpak.enable = true;
  
  #Excluding Packages
  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-boxes
    gnome-software
    gnome-characters
    pkgs.gnome-tour
    pkgs.snapshot
    pkgs.ferdium
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    gedit       # text editor
    simple-scan # document scanner
    totem       # video player
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
  ];
  
  services.xserver.excludePackages = [
    pkgs.xterm
  ];

}
