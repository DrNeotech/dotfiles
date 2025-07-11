{pkgs,...}:
{
  programs.vscode= {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-pyright.pyright  # Needed if you're using Pyright
      charliermarsh.ruff
    ];	
  };
}