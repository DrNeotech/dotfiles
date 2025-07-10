{config, pkgs, lib,...}:
let
  fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
    };
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # Plugins
      telescope-nvim
      nvim-tree-lua
      nvim-treesitter
      lualine-nvim
      (fromGitHub "6bb3f8fb5a3c64ca614d7c4782d4965863c41675" "main" "2KAbhishek/termim.nvim")
      (fromGitHub "0d1c4e122e32cee49ef48cdfb448ed0d4d2ba6e9" "main" "CRAG666/betterTerm.nvim")

      # Themes
      catppuccin-nvim
    ];
  };

	home.packages = with pkgs; [
		neovide
	];
}