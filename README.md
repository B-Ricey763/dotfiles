# B Ricey's Dotfiles

Configurations for a bunch of unix/macos apps that I use.

## Unix (Linux/MacOs agonstic)

- [Neovim](https://neovim.io/): text editor
- [Ghostty](https://ghostty.org/): (might have some macos specific settings)
  terminal emulator
    - Note, you have to set `ghostty_cmd` in `~/.config/chezmoi/chezmoi.toml` as described [here](https://www.chezmoi.io/user-guide/manage-machine-to-machine-differences/#use-templates) in order for the shell to be picked up
- [fish](https://fishshell.com/): shell (I've tried [nushell](https://www.nushell.sh/) in the past, but it's not there yet)
- [starship.rs](https://starship.rs/): cross-platform prompt
- [sioyek](https://sioyek.info/#): pdf viewer (don't ask why I don't just use preview)

> Note: Sioyek (my pdf viewer) to my knowledge can't use `~/.config`, so I have
> to store it in another random location

## MacOS Specific

- [yabai](https://github.com/koekeishiya/yabai): tiling window manager (this is SUCH a pain on MacOS)
- [skhd](https://github.com/koekeishiya/skhd): global hotkeys that can trigger shell commands (primarly used for yabai bindings)
