{ config, pkgs, user, ... }:

{

  environment.systemPackages = with pkgs; [
    libsecret
    polkit
    polkit_gnome
  ];

  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  security.pam.services.greetd.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-vfs0090;
    };
  };

  security.pam.services.greetd.fprintAuth = true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.hyprlock.fprintAuth = true;
}
