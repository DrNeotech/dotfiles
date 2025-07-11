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
			", Print, exec, grim -g '$(slurp -d)' - | wl-copy" # FIX: slurp needs to be in double quotes
			"$mainMod, W, exec, bash /home/ktlyn/.local/bin/wallch.sh"
			"$mainMod, R, exec, hyprctl reload"
			"$mainMod ALT, B, togglespecialworkspace, magic"
			"$mainMod, B, movetoworkspaceSilent, special:magic"

			"$mainMod, KP_End, workspace, 1"
			"$mainMod, KP_Down, workspace, 2"
			"$mainMod, KP_Next, workspace, 3"
			"$mainMod, KP_Left, workspace, 4"
			"$mainMod, KP_Begin, workspace, 5"
			"$mainMod, KP_Right, workspace, 6"
			"$mainMod, KP_Home, workspace, 7"
			"$mainMod, KP_Up, workspace, 8"
			"$mainMod, KP_Prior, workspace, 9"
			"$mainMod, KP_Insert, workspace, 10"

		];
		bindm = [
			"$mainMod, mouse:272, movewindow"
		 	"$mainMod, mouse:273, resizewindow"
		];
	};
}