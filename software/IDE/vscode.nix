{pkgs,...}:
{
  programs.vscode= {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-pyright.pyright  # Needed if you're using Pyright
      charliermarsh.ruff
    ];	
  };
}