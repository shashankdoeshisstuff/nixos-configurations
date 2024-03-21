{ config, pkgs, ... }:

{
  # Limits
  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
  ];
  
  systemd.user.services.moon = {
    description = "start-cadence";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''cadence-session-start --system-start'';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true; 
  users.extraUsers.moon.extraGroups = [ "audio" ];
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  hardware.pulseaudio.package = pkgs.pulseaudio.override { jackaudioSupport = true; };
  
  users.users.moon = {
    isNormalUser = true;
    description = "Shashank Maurya";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      tonelib-zoom
    ];
  };

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    # audio package
    # kmetronome
    jack2
    pulseaudio
    qjackctl
    wineWowPackages.stable
    (wine.override { wineBuild = "wine64"; })
    yabridge
    yabridgectl
    reaper
    # plugins
    lsp-plugins
    calf
    surge
    surge-XT
    tunefish
    helm
    dexed
    distrho
    zam-plugins
    vital
    odin2
    carla
    guitarix
    gxplugins-lv2
  ];
  
  # Environment Variables
  environment.variables = {
    yabridgectl = "/etc/profiles/per-user/moon/lib";
  };

}
