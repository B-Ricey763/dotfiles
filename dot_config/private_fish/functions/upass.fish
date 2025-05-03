function upass --wraps="lpass ls | fzf | sed -n 's/.*\\[id: \\([0-9]*\\)\\].*/\\1/p' | xargs lpass show -c --username" --description "alias upass=lpass ls | fzf | sed -n 's/.*\\[id: \\([0-9]*\\)\\].*/\\1/p' | xargs lpass show -c --username"
  lpass ls | fzf | sed -n 's/.*\[id: \([0-9]*\)\].*/\1/p' | xargs lpass show -c --username $argv
        
end
