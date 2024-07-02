function iglo(){
    git log --pretty=format:"%h %ad %<(8,trunc)%aN %s" --date=short | fzf --preview 'git show --color $(echo {} \
        | grep -o "[a-f0-9]\{7\}" \
        | sed -n "1p")' --bind='enter:execute(echo -n $(echo {} \
        | grep -o "[a-f0-9]\{7\}" \
        | sed -n "1p") | pbcopy)+abort' --bind='alt-e:execute(git show $(echo {} \
        | grep -o "[a-f0-9]\{7\}" \
        | sed -n "1p") | nvim -)'
}
