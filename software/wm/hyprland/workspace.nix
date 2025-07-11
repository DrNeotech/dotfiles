{config, pkgs, inputs,...}:
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "r[8], rounding:15,gapsin:40,gapsout:10"
      "w[2-10]"
    ];
  };
}