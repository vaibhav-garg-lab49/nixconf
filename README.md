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

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

