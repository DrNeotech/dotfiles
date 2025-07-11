{config, pkgs, inputs, ...}:
{
	wayland.windowManager.hyprland.settings = {
		monitor = [
			"DP-1, 1920x1080@165, 0x0, 1"
			"HDMI-A-1, 1920x1080@75, 1920x0, 1"
		];

		exec-once = [
			"swww-daemon"
			"[workspace 3] steam"
			"[workspace 6 silent] kitty yazi"
			"[workspace 6 silent] kitty spotify_player"
			"[workspace 6 silent] kitty cava"
			"[workspace 7] vesktop"
		];

		debug = {
			damage_tracking = 0;
		};

		general = {
			gaps_in = 9;
			gaps_out = 6;

			border_size = 4;

			# https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
			#"col.active_border" = "rgba(${config.lib.stylix.colors.base01}) rgba(${config.lib.stylix.colors.base01}) 45deg";
			#"col.inactive_border" = "rgba(${config.lib.stylix.colors.base02})";

			# Set to true enable resizing windows by clicking and dragging on borders and gaps
			resize_on_border = false;

			# Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
			allow_tearing = false;
		};

		decoration = {
			rounding = 4;

			# Change transparency of focused and unfocused windows
			active_opacity = 1;
			inactive_opacity = 1.0;

			shadow = {
				enabled = true;
				range = 4;
				render_power = 3;
				#"color" = "rgba(${config.lib.stylix.colors.base01})";
			};

			# https://wiki.hyprland.org/Configuring/Variables/#blur
			blur = {
				enabled = true;
				size = 3;
				passes = 10;

				vibrancy = 0.1696;
			};
			animations = {
				#enabled = true;

				# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];
				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
				];
			};
		};
	};
}