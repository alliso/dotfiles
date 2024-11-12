function cds(){
   dir=$(ls $HOME/Documents/services/ | fzf)
   full_dir="$HOME/Documents/services/$dir"

   zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/dotfiles/zellij/.config/zellij/services_layout.kdl --pane-frames true
}

function cdr(){
    if [ $# -lt 1 ]
    then
        dir=$(ls $HOME/Documents/CTT/ | fzf)
        full_dir="$HOME/Documents/CTT/$dir"

        session=$(zellij ls | grep $dir | wc -l)
        if [ $session -eq 1 ]
        then
            echo $session
            zellij attach $dir
            return
        fi

        zellij options --session-name $dir --default-cwd $full_dir
        return
    fi

    dir=$(ls $HOME/Documents/CTT/ | fzf -q $1)
    full_dir="$HOME/Documents/CTT/$dir"

    session=$(zellij ls | grep $dir | wc -l)
    if [ $session -eq 1 ]
    then
        echo $session
        zellij attach $dir
        return
    fi

    zellij options --session-name $dir --default-cwd $full_dir
}
