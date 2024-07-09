alias zj='zellij'

function zja(){
         session=$(zellij ls -s | fzf)
         zellij a $session
}
