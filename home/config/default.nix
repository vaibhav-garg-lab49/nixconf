{
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./helix.nix
    ./shell.nix
    ./starship.nix
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    fd
    btop
    gnumake
    git-crypt
    tldr
    unzip
    lazygit
    nil
    nixd
    nixfmt-rfc-style
    glow
    nerd-fonts.fira-code
    gcc
    gdu
    claude-code
    inputs.xvim.packages.${system}.default
    zellij
  ];

  fonts = {
    fontconfig.enable = true;
  };
  programs = {
    #   # A command-line fuzzy finder
    fzf = {
      enable = true;
      # https://github.com/catppuccin/fzf
      # catppuccin-mocha
      colors = {
        "bg+" = "#313244";
        "bg" = "#1e1e2e";
        "spinner" = "#f5e0dc";
        "hl" = "#f38ba8";
        "fg" = "#cdd6f4";
        "header" = "#f38ba8";
        "info" = "#cba6f7";
        "pointer" = "#f5e0dc";
        "marker" = "#f5e0dc";
        "fg+" = "#cdd6f4";
        "prompt" = "#cba6f7";
        "hl+" = "#f38ba8";
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    # Atuin replaces your existing shell history with a SQLite database,
    # and records additional context for your commands.
    # Additionally, it provides optional and fully encrypted
    # synchronisation of your history between machines, via an Atuin server.
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      settings = {
        style = "full";
      };
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
            IdentityFile ~/.ssh/id_ed25519
            # Specifies that ssh should only use the identity file explicitly configured above
            # required to prevent sending default identity files first.
            IdentitiesOnly yes
      '';
    };
  };
}
