# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

```bash
./setup.sh   # Symlink all configs; auto-detects macOS and installs Homebrew + packages
```

`setup.sh` uses `link_file` which skips destinations that already exist — re-running is safe.

## Repository Layout

- `shared/` — configs for any Unix-like system (Linux + macOS)
- `macos/` — macOS-only configs (yabai, skhd, sioyek, zshrc, Brewfile)

Symlink targets:

| Source | Destination |
|---|---|
| `shared/bashrc` | `~/.bashrc` |
| `shared/gitconfig` | `~/.gitconfig` |
| `shared/starship.toml` | `~/.config/starship.toml` |
| `shared/nvim/` | `~/.config/nvim/` |
| `shared/tmux/` | `~/.config/tmux/` |
| `shared/ghostty/` | `~/.config/ghostty/` |
| `shared/lazygit/` | `~/.config/lazygit/` |
| `macos/zshrc` | `~/.zshrc` |
| `macos/yabai/` | `~/.config/yabai/` |
| `macos/skhd/` | `~/.config/skhd/` |

## Neovim Architecture

Config lives in `shared/nvim/` and uses `mini.nvim` as the foundation, with `mini.deps` as the plugin manager (auto-bootstrapped in `init.lua`).

Plugin load order follows filenames in `plugin/`:

- `10_options.lua` — editor behavior, UI settings, diagnostics
- `20_keymaps.lua` — leader-based mappings (`<Space>` leader, e.g. `<Space>ff` find files)
- `30_mini.lua` — mini.nvim modules (icons, notifications, completion, sessions, etc.)
- `35_snacks.lua` — snacks.nvim configuration
- `40_plugins.lua` — tree-sitter (C, C++, Go) and language-specific plugins

Language-specific overrides go in `after/ftplugin/` and LSP setup in `after/lsp/`. Snippets are JSON files in `snippets/`.

## Theming

Catppuccin Mocha is used consistently across ghostty, tmux, starship, and neovim. When adding new tool configs, follow this theme.

## Local Overrides

Machine-specific settings go in files not tracked by this repo:
- `~/.bashrc.local` — sourced at end of bashrc
- `~/.gitconfig.local` — included at end of gitconfig
