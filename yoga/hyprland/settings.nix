{ lib, ... }:
{
 wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1";
    exec-once = [
      "hyprpaper"
      "waybar"
    ];
    "$mod" = "SUPER";
    bind = [
      "$mod, RETURN, exec, foot"
      "$mod, Q, killactive, "
      "$mod, M, exit, "
      "$mod, E, exec, dolphin"
      "$mod, V, togglefloating, "
      "$mod, F, fullscreen, "
      "$mod, D, exec, rofi -show drun"
      "$mod, P, pseudo," # dwindle
      "$mod, J, togglesplit," # dwindle
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_SINK@ 10%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_SINK@ 10%-"
      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_SINK@ toggle"
      ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp,exec,brightnessctl set +10%"      
      ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"
      
      ",Print,exec,grimblast copy"
      "$mod,Print,exec,grimblast copy area"
      ]
      # generate entry like "$mod, 1, workspace, 1"
      ++ map (x: "$mod, ${toString (lib.mod x 10)}, workspace, ${toString x}") (lib.lists.range 1 10)
      # generate entry like "$mod SHIFT, 1, movetoworkspace, 1"
      ++ map (x: "$mod SHIFT, ${toString (lib.mod x 10)}, movetoworkspace, ${toString x}") (lib.lists.range 1 10);
    bindm = [
      "bindm = $mod, mouse:272, movewindow"
      "bindm = $mod, mouse:273, resizewindow"
    ];
    input = {
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
      kb_layout = "us,ru";
      kb_options = "grp:alt_shift_toggle";
    };
    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 600;
      workspace_swipe_direction_lock_threshold = 3;
      workspace_swipe_min_speed_to_force = 10;
    };
    decoration = {
      blur = {
        enabled = false;
      };
      shadow = {
        enabled = false;
      };
    };
    misc = {
      vfr = true;
      disable_splash_rendering = true;
    };
  };
}
