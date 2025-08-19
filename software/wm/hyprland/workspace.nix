{config, pkgs, inputs,...}:
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1,monitor:HDMI-A-1,default:true"
      "4,monitor:HDMI-A-1"
      "7,monitor:HDMI-A-1"

      "2,monitor:DP-5,default:true"
      "5,monitor:DP-5"
      "8,monitor:DP-5"

      "9,monitor:HDMI-A-3,default:true,gapsin:24,gapsout:64,rounding 25,floating:1,layoutopt:orientation:right"
      "7,monitor:HDMI-A-3"
      "8,monitor:HDMI-A-3"
      "9,monitor:HDMI-A-3"
      "10,monitor:HDMI-A-3"
    ];

    windowrule = [
      #"nomaxsize,title:yazi.*,workspace:6"
      #"maxsize x y,title:cava, workspace:6"
      #"maxsize x y,title:spotify_player,workspace:6"
    ];
  };
}