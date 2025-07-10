# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ...}: 
{
  imports = [
		../../software/programs/neofetch.nix
		../../software/programs/spotify.nix
    ../../software/programs/cava.nix
    ../../software/programs/kitty.nix

		../../software/IDE/nvim.nix
    ../../software/IDE/vscode.nix

    ../../system/software/shells/zsh.nix
  ] ++ (map (wm: ../../software/wm/${wm}.nix) settings.wms);

  nixpkgs = {
    overlays = [];
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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}