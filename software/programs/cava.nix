{ config, pkgs, ... }:

{
	programs.cava = {
		enable = true;
		settings = {
			general.autosens = 1;
			color = {
				gradient = 0;
				foreground = "'#${config.stylix.base16Scheme.base08}'";
			};
		};
	};

	home.file.".config/cava/spotify-cava.conf".text = ''
[general]
bars = 40
bar_width = 2
bar_spacing = 1

[color]
gradient = 0
foreground = '#${config.stylix.base16Scheme.base08}'
		'';

}