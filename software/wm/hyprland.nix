{config, pkgs, inputs,...}:
{
  	imports = [
		./hyprland/env.nix
		./hyprland/settings.nix
		./hyprland/binds.nix
		./hyprland/workspace.nix
	];
}
