function ov(){
    if [ $# -lt 1 ]
    then
        dir=$(ls $HOME/Documents/obsidian-vaults/ | fzf)
        full_dir="$HOME/Documents/obsidian-vaults/$dir"

        zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/dotfiles/zellij/.config/zellij/obsidian_layout.kdl
        return
    fi

    dir=$(ls $HOME/Documents/obsidian-vaults/ | fzf -q $1)
    full_dir="$HOME/Documents/obsidian-vaults/$dir"

    zellij options --session-name $dir --default-cwd $full_dir --default-layout $HOME/dotfiles/zellij/.config/zellij/obsidian_layout.kdl

}
