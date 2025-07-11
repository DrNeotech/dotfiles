{config, pkgs, inputs,...}:
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1,monitor:DP-2,default:true"
      "2,monitor:DP-2"
      "3,monitor:DP-2"
      "4,monitor:DP-2"
      "5,monitor:DP-2"

      "6,monitor:HDMI-A-1,default:true,gapsin:24,gapsout:64,rounding 25,floating:1,layoutopt:orientation:right"
      "7,monitor:HDMI-A-1"
      "8,monitor:HDMI-A-1"
      "9,monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];

    windowrule = [
      #"nomaxsize,title:yazi.*,workspace:6"
      #"maxsize x y,title:cava, workspace:6"
      #"maxsize x y,title:spotify_player,workspace:6"
    ];
  };
}