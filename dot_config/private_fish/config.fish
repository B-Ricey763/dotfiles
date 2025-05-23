if status is-interactive
    # binds, remember mode for VI stuff
    bind ctrl-y --mode insert accept-autosuggestion

    # Make sure to run `fish_default_keybindings` to generate all the defaults

    # Configuring shortcuts. [co]nfig [fi]sh for example
    abbr --add cofi chezmoi edit --apply ~/.config/fish/
    abbr --add cogh chezmoi edit --apply ~/.config/ghostty/config
    abbr --add cosk chezmoi edit --apply ~/.config/skhd/skhdrc
    abbr --add coya chezmoi edit --apply ~/.config/yabai/yabairc
    abbr --add cost chezmoi edit --apply ~/.config/starship.toml
    abbr --add cosi chezmoi edit --apply /Users/bricey/Library/Application\ Support/sioyek/
    abbr --add covi chezmoi edit --apply ~/.config/nvim/

    # Abbr
    abbr --add v nvim
    abbr --add lg lazygit

    # Make sure nvim is default editor
    set -gx EDITOR nvim

    # Prompt
    starship init fish | source

    # Fuzzies
    # fzf --fish | source

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
end




# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /Users/bricey/miniconda3/bin/conda
#     eval /Users/bricey/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/Users/bricey/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/Users/bricey/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/Users/bricey/miniconda3/bin" $PATH
#     end
# end
# # <<< conda initialize <<<

# Lazy load conda from this thread: https://stackoverflow.com/questions/74661211/how-to-wrap-the-conda-command-in-a-fish-function-to-initialize-conda-only-on-dem
function conda --wraps 'conda'
    echo 'Initializing conda...'
    # We erase ourselves because conda defines a function of the same name.
    # This allows checking that that happened and can prevent infinite loops
    functions --erase conda
    /home/bhanna30/miniforge3/condabin/conda "shell.fish" "hook" | source

    if not functions -q conda
        # If the function wasn't defined, we should not do the call below.
        echo 'Something went wrong initializing conda!' >&2
        return 1
    end
    # Now we can call `conda`, which is a function, but not this one (because we erased it),
    # so this is not an infinite loop.
    conda $argv
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc' ]; source '/Users/bricey/Downloads/google-cloud-sdk/path.fish.inc'; end

thefuck --alias | source
