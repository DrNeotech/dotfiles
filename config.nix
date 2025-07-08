{pkgs, inputs, ...}:
rec {
	system = "x86_64-linux";
	profile = "desktop";
	username = "ktlyn";
	
 	timezone = "Australia/Brisbane";
  locale = "en_GB.UTF-8";
	
	shell = "zsh";
	shellPkg = pkgs.zsh;

	wms = ["hyprland"];
	editors = [ "neovim" "codium" ];
}
