{config, pkgs, inputs, ...}:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi
    ];
    package = (pkgs.obs-studio.override {
      cudaSupport = true;
    });
  };
}