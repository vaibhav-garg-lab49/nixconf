# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  pkgs,
  vars,
  ...
}: {
  users.users.${vars.os_user} = {
    isNormalUser = true;
    createHome = true;
    home = "/home/${vars.os_user}";
    extraGroups = ["wheel" "podman"];
    shell = pkgs.nushell;
  };
  imports = [
    ./podman.nix
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc # GCC C++ runtime
    zlib # needed by many python wheels
    # add any other libraries uv/python might need
  ];

  wsl.enable = true;
  wsl.defaultUser = vars.os_user;
  networking.hostName = vars.system_name;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
