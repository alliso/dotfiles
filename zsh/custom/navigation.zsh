function cds(){
   dir=$(ls $HOME/Documents/services/ | fzf)
   full_dir="$HOME/Documents/services/$dir"

   zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/Documents/dotfiles/zellij/services_layout.kdl --pane-frames true
}

function cdr(){
   dir=$(ls $HOME/Documents/CTT/ | fzf)
   full_dir="$HOME/Documents/CTT/$dir"

   zellij options --session-name $dir --default-cwd $full_dir
}
