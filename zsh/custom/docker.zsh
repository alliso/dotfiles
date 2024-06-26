alias dbash='docker exec -it $(docker ps --format "{{.Names}}" | fzf ) bash'
alias dlogs='docker logs -f $(docker ps --format "{{.Names}}" | fzf )'

function dgp(){
    container=$(docker ps --format "table {{.Image}}\t{{.Ports}}" | fzf --header-lines=1 --header-first)
    port=$(echo $container | awk -F'   ' '{print $2}' | tr ", " "\n" | grep -e '->' | fzf)
    formatted_port=$(echo $port | awk -F'->' '{print $1}'| awk -F':' '{print $2}')
    echo $formatted_port | pbcopy
    echo "Port $formatted_port copied successfully"
}
