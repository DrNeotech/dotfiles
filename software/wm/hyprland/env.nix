{ config, pkgs, ... }:
{
  	wayland.windowManager.hyprland.settings = {
		env = [
			"XCURSOR_THEME,default"
			"XCURSOR_SIZE,24"
			"HYPRCURSOR_SIZE,8"
			"LIBVA_DRIVER_NAME,nvidia"
			"__GLX_VENDOR_LIBRARY_NAME,nvidia"
			"NVD_BACKEND,direct"
		];
  	};
}