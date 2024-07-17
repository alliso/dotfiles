alias zj='zellij'

function zja(){
         session=$(zellij ls -s | fzf)
         zellij a $session
}

function zjs(){
         session_name=$(pwd | awk -F'/' '{print $NF}')
         zj --session $session_name
}
