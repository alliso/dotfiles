function on(){
 if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-name> "
    return
  fi
  filename=$1.md
  tmux new-session -A "cd /Users/alliso/Documents/obsidian-vaults/ctt/inbox && touch $filename && nvim $filename"
}

function oe(){
 if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <file-name> "
    return
  fi
  filename=$1.md
  sname="obsidian-creator"
  tmux new-session -D -s $sname -A "cd /Users/alliso/Documents/obsidian-vaults/ctt/inbox && touch $filename && nvim $filename"
  tmux send-keys -t $name ":ObsidianTemplate drawing_template"
  tmux kill-session -t $name
  open obsidian://vault/ctt/$filename
}
