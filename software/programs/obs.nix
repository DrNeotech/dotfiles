{config, pkgs, ...}:
{
  programs.obs-studio = {
    enable = withGUI;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}