# 🔥 xvim - Enhanced Neovim Configuration

⚠️ **Warning** ⚠️

This is a work in progress setup and subject to frequent changes. Use at your own risk.

## 🔍 Overview

xvim is a portable Neovim configuration that leverages Nix packages and Lua for configuration, fully integrating with lazy.nvim. This setup provides a consistent and customizable development environment across different systems.

## ✨ Features

- **Nix Integration**: Manage dependencies and configurations using Nix and Nix Flakes
- **Lazy.nvim**: Built on the LazyVim distro for efficient plugin management
- **Development Tools**: Includes tools like Alejandra for code formatting and linting
- **LSP Support**: Integrated language server protocol for intelligent code completion
- **Treesitter**: Advanced syntax highlighting and code navigation
- **Beautiful UI**: Catppuccin theme with custom components

## 🚀 Installation

You can install xvim via Nix with the following command:

```bash
nix profile install github:ck3mp3r/xvim
```

## 🔧 Configuration

xvim is configured through Lua files located in the `config/lua` directory:

- `config/`: Core configuration files
- `plugins/`: Plugin-specific configurations
- `lib/`: Shared utilities and components

## 🧩 Plugins

xvim comes with a carefully selected set of plugins for an optimal development experience:

- LSP integration for code intelligence
- Treesitter for syntax highlighting
- Catppuccin theme for a beautiful interface
- Obsidian integration for note-taking
- Markdown preview
- And many more!

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues or pull requests.
