function cds(){
   dir=$(ls $HOME/Documents/services/ | fzf)
   full_dir="$HOME/Documents/services/$dir"

   zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/dotfiles/zellij/.config/zellij/services_layout.kdl --pane-frames true
}

function cdr(){
        if [[ $# -eq 1 ]]; then
                selected=$1
        else
                selected=$(find ~/Documents/proyectos ~/Documents/CTT ~/Documents/CTT/files -mindepth 1 -maxdepth 1 -type d | fzf)
        fi

        if [[ -z $selected ]]; then
                return
        fi

        selected_name=$(basename "$selected" | tr . _)
        tmux_running=$(pgrep tmux)

        if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                tmux new-session -s $selected_name -c $selected
                return
        fi

        if ! tmux has-session -t=$selected_name 2> /dev/null; then
                tmux new-session -ds $selected_name -c $selected
        fi


        tmux switch-client -t $selected_name
}

zle -N cdr cdr
bindkey -s ^f "cdr\n"

function open_default_session(){
        selected_name="default"

        if [[ -z $TMUX ]] ; then
                tmux new-session -As $selected_name -c $HOME
                return
        fi

        if ! tmux has-session -t=$selected_name 2> /dev/null; then
                tmux new-session -As $selected_name -c $HOME
                return
        fi


        tmux switch-client -t $selected_name
}
zle -N open_default_session open_default_session
bindkey -s ^h "open_default_session\n"

function tmux_attach_to_session(){
        selected_session=$(tmux ls -F#{session_name} | fzf)

        if [[ -z $TMUX ]] ; then
                tmux attach -t $selected_session
                return
        fi

        tmux switch-client -t $selected_session
}
zle -N tmux_attach_to_session tmux_attach_to_session
bindkey -s ^s "tmux_attach_to_session\n"
