{
  pkgs,
  vars,
  ...
}: {
  home.packages = with pkgs; [
    lazyjj
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = vars.vcs_user;
        email = vars.vcs_email;
      };
    };
  };
}
