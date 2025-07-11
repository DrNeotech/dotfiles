{config, pkgs, inputs,...}:
{
	wayland.windowManager.hyprland.settings = {
		"$mainMod" = "SUPER";

		bind = [
			"$mainMod, C, exec, kitty"
			"$mainMod, X, killactive,"
			"$mainMod, M, exit,"
			"$mainMod, V, togglefloating,"
			"$mainMod, R, exec, wofi --show drun"
			"$mainMod, P, pseudo," # dwindle
			"$mainMod, J, togglesplit," # dwindle

			"$mainMod_CONTROL,F,fullscreen"
			"$mainMod, Z, exec, rofi -show drun"
			"$mainMod CTRL, Z, exec, rofi -show run"
			"$mainMod, F, exec, nautilus -w"
			", Print, exec, grim -g '$(slurp -d)' - | wl-copy"
			"$mainMod, W, exec, bash /home/ktlyn/.local/bin/wallch.sh"
			"$mainMod, R, exec, hyprctl reload"
			"$mainMod ALT, B, togglespecialworkspace, magic"
			"$mainMod, B, movetoworkspaceSilent, special:magic"
		];
		bindm = [
			"$mainMod, mouse:272, movewindow"
		 	"$mainMod, mouse:273, resizewindow"
		];
	};
}