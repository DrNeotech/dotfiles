{pkgs, inputs, ...}:
rec {
	system = "x86_64-linux";
	profile = "desktop";
	username = "ktlyn";
	hostname = "neotech-pc";
	
 	timezone = "Australia/Brisbane";
  locale = "en_AU.UTF-8";
	
	shell = "zsh";
	shellPkg = pkgs.zsh;

	wms = ["hyprland"];
	editors = [ "neovim" "codium" ];
}
