{ config, pkgs, ... }:

{
	programs.cava = {
		enable = true;
		settings = {
			general.autosens = 1;
		};
	};
}