# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, settings, ...}: 
{
  imports = [
		../../software/programs/neofetch.nix
		../../software/programs/spotify.nix
    ../../software/programs/cava.nix
    ../../software/programs/kitty.nix
    ../../software/programs/obs.nix
    ../../software/programs/retroarch.nix

		../../software/IDE/nvim.nix
    ../../software/IDE/vscode.nix

    ../../system/software/shells/zsh.nix
    ../../system/software/shells/tmux.nix
    ../../software/wm/hyprland.nix

    ../../themes/stylix.nix
  ];

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

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    VDPAU_DRIVER = "nvidia";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    steam
    kitty
    qbittorrent
    egl-wayland
    swaybg
    ffmpeg_6-full
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
    vesktop
    gpu-screen-recorder
    tty-clock
    rpi-imager
    zoom-us
    kdePackages.kdenlive
    btop
    #libva-nvidia-driver
  ];


  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.firefox.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}