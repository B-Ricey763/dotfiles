# My dotfiles

All the things I use on the day to day

## Quickstart

Clone and run `setup.sh` to make symlinks. It will autodetect OS and go from there.
On macOS, it installs the Brewfile packages. It also bootstraps TPM and installs all
declared tmux plugins, so no manual clone or `prefix + I` is needed.

On other Unix-like systems, install `git` and `tmux` with your system package
manager before running the script. Missing commands are reported and tmux plugin
setup is skipped.

## Tools

### Shared (Unix+)

- [ghostty](https://ghostty.org/): terminal
- [starship](https://starship.rs/): pretty shell prompt
- [zsh](https://www.zsh.org/): shell
- [nvim](https://neovim.io/): I use neovim btw
- [tmux](https://github.com/tmux/tmux)

### MacOS

- [homebrew](https://brew.sh/): package manager
- [sioyek](https://sioyek.info/): pdf viewer
- [skhd](https://github.com/koekeishiya/skhd): keybinds helper
- [yabai](https://github.com/koekeishiya/yabai): window manager (needs some SIP disabling)
