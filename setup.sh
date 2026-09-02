#!/bin/bash

# Define paths
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
CONFIG_DIR="$HOME/.config"

# Create .config dir if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Helper for symlinking
link_file() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Skipping $dest - already exists"
    else
        echo "Linking $src -> $dest"
        ln -s "$src" "$dest"
    fi
}

setup_tmux_plugins() {
    local plugin_dir="$HOME/.tmux/plugins"
    local tpm_dir="$plugin_dir/tpm"

    if ! command -v git &>/dev/null; then
        echo "Skipping tmux plugins: git is not installed"
        return
    fi

    if ! command -v tmux &>/dev/null; then
        echo "Skipping tmux plugins: tmux is not installed"
        return
    fi

    mkdir -p "$plugin_dir"

    if [ ! -e "$tpm_dir" ]; then
        echo "Installing TPM..."
        if ! git clone --depth 1 https://github.com/tmux-plugins/tpm "$tpm_dir"; then
            echo "Failed to install TPM" >&2
            return 1
        fi
    elif [ -d "$tpm_dir/.git" ]; then
        echo "TPM is already installed"
    else
        echo "$tpm_dir exists but is not a TPM Git checkout" >&2
        return 1
    fi

    echo "Installing missing tmux plugins..."
    if ! "$tpm_dir/bin/install_plugins"; then
        echo "Failed to install tmux plugins" >&2
        return 1
    fi
}

echo "--- Shared configs ---"
link_file "$DOTFILES_DIR/shared/ghostty" "$CONFIG_DIR/ghostty"
link_file "$DOTFILES_DIR/shared/tmux" "$CONFIG_DIR/tmux"
link_file "$DOTFILES_DIR/shared/starship.toml" "$CONFIG_DIR/starship.toml"
link_file "$DOTFILES_DIR/shared/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/shared/nvim" "$CONFIG_DIR/nvim"
link_file "$DOTFILES_DIR/shared/gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/shared/lazygit" "$CONFIG_DIR/lazygit"

# macOS Setup (Runs automatically on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "--- macOS Setup ---"

    # Install Homebrew if not present
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Ensure brew is available in current shell session
        if [[ $(uname -m) == "arm64" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    fi

    echo "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/macos/Brewfile"

    echo "--- macOS Configs ---"
    link_file "$DOTFILES_DIR/macos/zshrc" "$HOME/.zshrc"
    link_file "$DOTFILES_DIR/macos/skhd" "$CONFIG_DIR/skhd"
    link_file "$DOTFILES_DIR/macos/yabai" "$CONFIG_DIR/yabai"

    # Sioyek (Selective linking)
    SIOYEK_DEST="$HOME/Library/Application Support/sioyek"
    mkdir -p "$SIOYEK_DEST"
    link_file "$DOTFILES_DIR/macos/sioyek/prefs_user.config" "$SIOYEK_DEST/prefs_user.config"
    # link_file "$DOTFILES_DIR/macos/sioyek/keys_user.config" "$SIOYEK_DEST/keys_user.config"
fi

echo "--- Tmux Plugins ---"
if ! setup_tmux_plugins; then
    echo "Tmux plugin setup failed" >&2
    exit 1
fi

echo "Setup complete."
