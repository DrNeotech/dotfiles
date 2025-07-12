{pkgs, inputs, settings, config, ...}:
{
	stylix = {
		enable = true;
    autoEnable = false;
		image = ../assets/wallpapers/dopesmoker.png;
    #contrast = 50;
		polarity = "dark";
    opacity.terminal = 1.0;
    targets = {
      kitty.enable = true;
      hyprland.enable = true;
      vscode.enable = false;
      spotify-player.enable = true;
      cava.enable = true;
      vencord.enable = true;
      vesktop.enable = true;
      yazi.enable = true;
    };
	};
}