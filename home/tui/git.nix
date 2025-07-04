{
  config,
  lib,
  pkgs,
  vars,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig =
    lib.hm.dag.entryBefore ["checkLinkTargets"] "rm -f ${config.home.homeDirectory}/.gitconfig";

  home.packages = with pkgs; [
    lazygit
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = vars.vcs_user;
    userEmail = vars.vcs_email;

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      safe.directory = "*";
    };
  };
}
