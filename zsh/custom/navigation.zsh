function cds(){
   dir=$(ls /Users/alliso/Documents/services/ | fzf)
   full_dir="/Users/alliso/Documents/services/$dir"

   zellij options --session-name $dir --default-cwd $full_dir --default-layout /Users/alliso/Documents/dotfiles/zellij/services_layout.kdl
}

function cdr(){
   dir=$(ls /Users/alliso/Documents/CTT/ | fzf)
   full_dir="/Users/alliso/Documents/CTT/$dir"

   zellij options --session-name $dir --default-cwd $full_dir
}
