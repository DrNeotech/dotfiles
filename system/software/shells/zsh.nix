{ settings, config, pkgs, lib, ... }:
{
	imports = [
		./tmux.nix
	];

	programs.tmux.shell = "${pkgs.zsh}/bin/zsh";

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
					tty-clock = "tty-clock -c -C 6 -t";
        };	
	};

	home.packages = with pkgs; [
		oh-my-zsh
	];
}