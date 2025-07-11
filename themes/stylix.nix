{pkgs, inputs, settings, config, ...}:
{
	stylix = {
		enable = true;
    autoEnable = false;
		image = ../assets/wallpapers/heaven_sent.png;
    #contrast = 50;
		polarity = "dark";
    opacity.terminal = 1.0;
    targets = {
      kitty.enable = true;
      hyprland.enable = true;
      vscode.enable = false;
    };
	};
}