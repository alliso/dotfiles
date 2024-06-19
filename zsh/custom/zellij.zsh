alias zj='zellij'

function zjg(){
         session=$(zellij ls -s | fzf)
         zellij a $session
}
