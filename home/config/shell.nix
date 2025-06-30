{pkgs, ...}:
  {
  programs.nushell = {
    enable = true;
    # configFile.source = ../dotfiles/nushell/config.nu;
    settings = {
      use_ansi_coloring = true;
      show_banner = false;

      table = {
        mode = "rounded";
        index_mode = "always";
        show_empty = true;
        trim = {
          methodology = "wrapping";
          wrapping_try_keep_words = true;
          truncating_suffix = "...";
        };
      };

      completions = {
        case_sensitive = false;
        quick = true;
        partial = true;
        algorithm = "prefix";
      };

      filesize = {
        unit = "MB";
      };

      cursor_shape = {
        emacs = "line";
        vi_insert = "block";
        vi_normal = "underscore";
      };

      footer_mode = 25;
      float_precision = 2;
      bracketed_paste = true;
      edit_mode = "emacs";
      render_right_prompt_on_last_line = false;
      buffer_editor = "nvim";
    };
    shellAliases = {
    n = "nvim";
    v = "nvim";
    vi = "nvim";
    vim = "nvim";
    emacs = "nvim";

    # Colors
    ip = "ip -color";
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    tree = "tree -C";

    # Misc
    t = "tldr";
    df = "duf --hide special";
    cat = "bat";
    cp = "cp -v";
    mv = "mv -v";
    rm = "rm -v";
    rmdir = "rmdir -p";
    lg = "lazygit";
    y = "yazi";
    zj = "zellij";
    c = "clear";
        la = "ls -a";
        ll = "ls -l";
      };
    extraConfig = ''
      $env.NIX_SSL_CERT_FILE = "/mnt/c/Users/vaibhav.garg/certi/cacert.pem"
      $env.PATH = ($env.PATH | append [$"($env.HOME)/.nix-profile/bin" $"($env.HOME)/.local/bin" "/nix/var/nix/profiles/default/bin"])
      ${pkgs.krabby}/bin/krabby random --no-mega --no-gmax --no-regional --no-title -s
    '';
  };
}
