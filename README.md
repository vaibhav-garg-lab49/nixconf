# 🚀 NixOS WSL Configuration

A complete, flake-based configuration for running NixOS inside Windows Subsystem for Linux (WSL).

![NixOS Logo](https://github.com/NixOS/nixos-artwork/blob/master/logo/nix-snowflake-rainbow.svg)

## ✨ Features

- Full NixOS environment in WSL
- Customizable user and system configuration
- Neovim setup with plugins and custom configuration
- TUI and GUI application support
- Git integration
- Containerization with Podman
- And much more!

## 🛠️ Prerequisites

- Windows 10/11 with WSL2 enabled
- latest nixos wsl installed from [nixwsl-release-page](https://github.com/nix-community/NixOS-WSL/releases)
- Basic familiarity with Nix and the command line

## 📋 Setup Instructions

### 1. Clone this repository

```bash
git clone <this-repo-link>
cd <repo-folder>
```

### 2. Configure your personal settings

Edit the `vars.nix` file to customize your configuration:

```nix
{
  os_user = "your-username";        # Change from "v" to your preferred username
  system_name = "your-hostname";    # Change from "nixwsl" to your preferred hostname
  git_user = "your-git-username";   # Your Git username
  git_email = "your-email@example.com"; # Your Git email
  ssl_cert_path = "/path/to/your/cert.pem"; # Path to your SSL certificate if needed
}
```

### 3. Initial NixOS Setup

To change the default 'nixos' user and machine name:

```bash
sudo nixos-rebuild boot --flake .#your-hostname
```

Replace `your-hostname` with the `system_name` you specified in `vars.nix`.

### 4. Restart WSL to apply hostname and user changes

From PowerShell or Command Prompt in Windows:

```powershell
wsl --shutdown
```

Then restart WSL by opening your terminal again.

### 5. Apply Home Manager Configuration

After restarting WSL with your new user and hostname:

```bash
home-manager switch --flake .#your-username -b backup
```

Replace `your-username` with the `os_user` you specified in `vars.nix`.

## 🔄 Using the Makefile

The repository includes a Makefile to simplify common operations:

```bash
# Apply both NixOS and Home Manager configurations
make nixos

# Apply only Home Manager configuration
make hm
```

**Note:** Make sure to update the Makefile commands if you changed the `os_user` or `system_name` in `vars.nix`.

## 📁 Repository Structure

- `flake.nix`: The main entry point for the Nix flake
- `vars.nix`: Personal configuration variables
- `os/`: System-level NixOS configuration
- `home/`: Home-manager configuration for user environment
  - `tui/`: Terminal UI applications configuration
  - `gui/`: Graphical UI applications configuration
- `xvim/`: Neovim configuration with plugins

## 🔧 Customization

- Edit files in `home/` to customize your user environment
- Edit files in `os/` to customize system-wide settings
- The Neovim configuration in `xvim/` can be extended with additional plugins

## 🧰 Included Tools

### Terminal & Shell

| Tool | Description | Command | Config File |
|------|-------------|---------|-------------|
| [Nushell](https://www.nushell.sh/) | Modern shell with data processing capabilities | `nu` | `home/tui/shell.nix` |
| [Starship](https://starship.rs/) | Customizable cross-shell prompt | Integrated with shell | `home/tui/starship.nix` |
| [Direnv](https://direnv.net/) | Per-directory environment variables | Integrated with shell | `home/tui/direnv.nix` |
| [Bat](https://github.com/sharkdp/bat) | Cat clone with syntax highlighting | `bat` | `home/tui/bat.nix` |
| [Yazi](https://yazi-rs.github.io/) | Terminal file manager | `y`, `yazi` | `home/tui/yazi.nix` |

### Development

| Tool | Description | Command | Config File |
|------|-------------|---------|-------------|
| [Git](https://git-scm.com/) | Version control | `git` | `home/tui/git.nix` |
| [Helix](https://helix-editor.com/) | Modern modal text editor | `hx` | `home/tui/helix.nix` |
| [Neovim](https://neovim.io/) | Extensible vim-based editor | `n`, `v`, `vi`, `vim`, `nvim` | `xvim/` directory |
| [Podman](https://podman.io/) | Daemonless container engine | `podman` | `os/podman.nix` |
| [Lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git | `lg` | Included in shell aliases |
| [Lazydocker](https://github.com/jesseduffield/lazydocker) | Terminal UI for docker/podman | `ld` | Included in shell aliases |

### Common Aliases

```bash
# Editor
n, v, vi, vim    # nvim (Neovim)

# File operations
la               # ls -a
ll               # ls -l
y                # yazi (file manager)
cat              # bat (improved cat)
cp               # cp -v (verbose copy)
mv               # mv -v (verbose move)
rm               # rm -v (verbose remove)
df               # duf --hide special (disk usage)

# Development
lg               # lazygit
ld               # lazydocker
t                # tldr (command examples)

# Container management
# Podman is configured as a drop-in replacement for Docker
docker           # podman (Docker compatibility)

# Terminal
c                # clear
zj               # zellij (terminal multiplexer)
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

