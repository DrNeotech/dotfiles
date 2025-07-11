{pkgs, inputs, settings, config, ...}:
{
	stylix = {
		enable = true;
    autoEnable = false;
		image = ../assets/wallpapers/patchy_2mon.png;
		polarity = "dark";
    opacity.terminal = 0.4;
    targets = {
      kitty.enable = true;
      hyprland.enable = true;
      vscode.enable = true;
    };
	};
}