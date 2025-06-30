{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./tui ./gui];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
    sessionVariables = {
      backupFileExtension = "hm-bk";
      # Shell
      EDITOR = "nvim";
      TERM = "xterm-256color";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
