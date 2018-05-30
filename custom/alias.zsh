alias b='cd -1'
alias l='ls'

alias sa='source activate'
alias sd='source deactivate'

function gi() { curl -L -s https://www.gitignore.io/api/$@;}
hash thefuck 2>/dev/null && { eval $(thefuck --alias f) }

