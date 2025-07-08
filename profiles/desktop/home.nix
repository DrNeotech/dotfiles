# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ...}: 

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
  imports = [
		../../software/programs/neofetch.nix
		../../software/programs/spotify.nix
    ../../software/programs/cava.nix

		../../software/IDE/nvim.nix

  ];

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "ktlyn";
    homeDirectory = "/home/ktlyn";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    steam
    kitty
    qbittorrent
    egl-wayland
    swaybg
    ffmpeg
    grim
    slurp
    mpv
    nvidia-vaapi-driver
    rofi-wayland
    obsidian
    tree
    swww
    wl-clipboard
    waybar
    rustup
    nautilus
    gimp3-with-plugins
    fzf
    bluez
    spotify
    handbrake
    python314
    jackett
    flaresolverr
    tor-browser
    yazi
    direnv
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.firefox.enable = true;

  programs.vscode= {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-pyright.pyright  # Needed if you're using Pyright
      charliermarsh.ruff
    ];	
  };



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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}