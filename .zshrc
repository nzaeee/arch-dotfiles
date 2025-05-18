# Initialize starship prompt
eval "$(starship init zsh)"

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# Initialize thefuck
eval $(thefuck --alias)

# Modern replacements for standard commands
alias ls="eza -a --no-filesize --long --color=always --icons=always --no-user"
alias cat="bat"
alias cd="z"

# Git related aliases
alias g="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias glog='git log --oneline --graph --all'
alias lg="lazygit"
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'

# Utility aliases
alias cls="clear"
alias h="history 1 | fzf"
alias f="fuck"

# source zshrc 
alias reload="source ~/.zshrc"