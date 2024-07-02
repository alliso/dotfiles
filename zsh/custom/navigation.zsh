function cds(){
   dir=$(ls $HOME/Documents/services/ | fzf)
   full_dir="$HOME/Documents/services/$dir"

   zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/Documents/dotfiles/zellij/services_layout.kdl --pane-frames true
}

function cdr(){
    if [ $# -lt 1 ]
    then
        dir=$(ls $HOME/Documents/CTT/ | fzf)
        full_dir="$HOME/Documents/CTT/$dir"

        zellij options --session-name $dir --default-cwd $full_dir
        return
    fi

    dir=$(ls $HOME/Documents/CTT/ | fzf -q $1)
    full_dir="$HOME/Documents/CTT/$dir"

    zellij options --session-name $dir --default-cwd $full_dir
}
