function cpass --wraps="lpass ls | fzf | sed -n 's/.*\\[id: \\([0-9]*\\)\\].*/\\1/p' | xargs lpass show -c --password" --wraps="lpass ls | fzf | sed -n 's/.*\\[id: \\([0-9]*\\)\\].*/\\1/p' | xargs lpass show -c --username" --description "alias cpass=lpass ls | fzf | sed -n 's/.*\\[id: \\([0-9]*\\)\\].*/\\1/p' | xargs lpass show -c --password"
  lpass ls | fzf | sed -n 's/.*\[id: \([0-9]*\)\].*/\1/p' | xargs lpass show -c --password $argv
        
end
