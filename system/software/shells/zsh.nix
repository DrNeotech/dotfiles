{ settings, config, pkgs, lib, ... }:
{
	imports = [];

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
        };	
	};

	home.packages = with pkgs; [
		oh-my-zsh
	];
}