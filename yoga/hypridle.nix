{ pkgs, ... }:
{
  home.packages = with pkgs; [
  hypridle
  ];

  services.hypridle.enable = true;
  services.hypridle.settings = {
  general = {
    after_sleep_cmd = "hyprctl dispatch dpms on";
    before_sleep_cmd = "hyprctl dispatch dpms off";
    ignore_dbus_inhibit = false;
    lock_cmd = "hyprlock";
  };

  listener = [
    {
      timeout = 300;
      on-timeout = "hyprlock";
    }
    {
      timeout = 600;
      on-timeout = "hyprctl dispatch dpms off";
      on-resume = "hyprctl dispatch dpms on";
    }
  ];
  };
}
