{config, pkgs, ...}:
{
  imports = [
		./hyprland/hypr-config.nix
    ./hyprland/env.nix
  	];
	programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}