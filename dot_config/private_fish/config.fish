if status is-interactive
    # binds, remember mode for VI stuff
    bind --mode insert ctrl-y accept-autosuggestion

    # Configuring shortcuts. [co]nfig [fi]sh for example
    abbr --add cofi chezmoi edit --apply ~/.config/fish/
    abbr --add cogh chezmoi edit --apply ~/.config/ghostty/config
    abbr --add cosk chezmoi edit --apply ~/.config/skhd/skhdrc
    abbr --add coya chezmoi edit --apply ~/.config/yabai/yabairc
    abbr --add cost chezmoi edit --apply ~/.config/starship.toml
    abbr --add cosi chezmoi edit --apply /Users/bricey/Library/Application\ Support/sioyek/
    abbr --add covi chezmoi edit --apply ~/.config/nvim/

    abbr --add md mamba deactivate 
    abbr --add ma mamba activate

    abbr --add v nvim
    abbr --add lg lazygit

    # Make sure nvim is default editor
    set -gx EDITOR nvim

    # Setup tools
    starship init fish | source
    pixi completion --shell fish | source
    # atuin init fish | source

    # So that it navigates to symlinks 
    set -gx _ZO_RESOLVE_SYMLINKS 1
    zoxide init fish | source


    # Files
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # set pnpm home (a hack)
    # set -gx PNPM_HOME "$HOME/.pnpm"

    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba shell init' !!
    # set -gx MAMBA_EXE "$HOME/miniforge3/bin/mamba"
    # set -gx MAMBA_ROOT_PREFIX "$HOME/miniforge3"
    # $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    #
    # # Workaround, see https://github.com/mamba-org/mamba/issues/3847
    # alias mamba micromamba
    # mamba activate base

    # The next line updates PATH for the Google Cloud SDK.
    # if [ -f '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc' ]; source '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc'; end
end

