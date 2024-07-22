function ov(){
    if [ $# -lt 1 ]
    then
        dir=$(ls $HOME/Documents/obsidian-vaults/ | fzf)
        full_dir="$HOME/Documents/obsidian-vaults/$dir"

        session=$(zellij ls | awk '{print $1}' | awk -F'-' '{print $NF}' | grep -E 'ctt' | wc -l)
        if [ $session -eq 1 ]
        then
            echo $session
            zellij attach $dir
            return
        fi

        zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/Documents/dotfiles/zellij/obsidian_layout.kdl
        return
    fi

    dir=$(ls $HOME/Documents/obsidian-vaults/ | fzf -q $1)
    full_dir="$HOME/Documents/obsidian-vaults/$dir"

    session=$(zellij ls | grep $dir | wc -l)
    if [ $session -eq 1 ]
    then
        echo $session
        zellij attach $dir
        return
    fi

    zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/Documents/dotfiles/zellij/obsidian_layout.kdl

}
