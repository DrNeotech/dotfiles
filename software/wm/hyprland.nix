{config, pkgs, inputs,...}:
{
  imports = [
		./hyprland/hypr-config.nix
    ./hyprland/env.nix
  	];

    wayland.windowManager.hyprland = {
        enable = true;
        #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = true;
        plugins = [
          inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
        ];
    };
}
