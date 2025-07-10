{config, pkgs, ...}:
{
  imports = [
		./hyprland/hypr-config.nix
    ./hyprland/env.nix
  	];
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = true;
        plugins = [
            inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
        ] ++ lib.optional (settings.themeDetails.bordersPlusPlus)
            inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus;
    };
}
