if status is-interactive
    # binds, remember mode for VI stuff
    bind ctrl-y --mode insert accept-autosuggestion

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

    # Abbr
    abbr --add v nvim
    abbr --add lg lazygit

    # Make sure nvim is default editor
    set -gx EDITOR nvim

    # Setup tools
    starship init fish | source
    thefuck --alias | source
    pixi completion --shell fish | source
    atuin init fish | source

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

    # HACK: set pnpm home
    set -gx PNPM_HOME "$HOME/.pnpm"

    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba shell init' !!
    set -gx MAMBA_EXE "$HOME/miniforge3/bin/mamba"
    set -gx MAMBA_ROOT_PREFIX "$HOME/miniforge3"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<

    # Workaround, see https://github.com/mamba-org/mamba/issues/3847
    alias mamba micromamba
    # mamba activate base

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc' ]; source '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc'; end

end




# Lazy load conda from this thread: https://stackoverflow.com/questions/74661211/how-to-wrap-the-conda-command-in-a-fish-function-to-initialize-conda-only-on-dem
# function conda --wraps 'conda'
#     echo 'Initializing conda...'
#     # We erase ourselves because conda defines a function of the same name.
#     # This allows checking that that happened and can prevent infinite loops
#     functions --erase conda
#     /home/bhanna30/miniforge3/condabin/conda "shell.fish" "hook" | source
#
#     if not functions -q conda
#         # If the function wasn't defined, we should not do the call below.
#         echo 'Something went wrong initializing conda!' >&2
#         return 1
#     end
#     # Now we can call `conda`, which is a function, but not this one (because we erased it),
#     # so this is not an infinite loop.
#     conda $argv
# end

