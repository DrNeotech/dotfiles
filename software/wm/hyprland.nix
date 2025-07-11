{config, pkgs, inputs,...}:
{
  	imports = [
		./hyprland/env.nix
		./hyprland/settings.nix
		./hyprland/binds.nix
		#./hyprland/style.nix
		./hyprland/workspace.nix
	];
}
