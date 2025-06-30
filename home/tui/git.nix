{
  config,
  lib,
  pkgs,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig =
    lib.hm.dag.entryBefore ["checkLinkTargets"] "rm -f ${config.home.homeDirectory}/.gitconfig";

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "vaibhav-garg";
    userEmail = "vaibhav.garg@iongroup.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      safe.directory = "*";
    };
  };
}
