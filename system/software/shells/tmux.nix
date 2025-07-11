{pkgs, settings, ...}:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    extraConfig = ''
set -g allow-passthrough
    '';
  };
}