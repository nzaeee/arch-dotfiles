# Initialize starship prompt
eval "$(starship init zsh)"

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# Initialize thefuck
eval $(thefuck --alias)

# Initialize zsh options
setopt notify
setopt histignorealldups

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'

ZSH_AUTOSUGGESTIONS_DIR="$HOME/.config/zsh/plugins/zsh-autosuggestions"
if [ -d "$ZSH_AUTOSUGGESTIONS_DIR" ] && [ -f "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh" ]; then
  source "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh"
else
  echo "Warning: zsh-autosuggestions not found at $ZSH_AUTOSUGGESTIONS_DIR"
fi

ZSH_SYNTAX_HIGHLIGHTING_DIR="$HOME/.config/zsh/plugins/zsh-syntax-highlighting"
if [ -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ] && [ -f "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh" ]; then
  source "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh"
else
  echo "Warning: zsh-syntax-highlighting not found at $ZSH_SYNTAX_HIGHLIGHTING_DIR"
fi

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

fastfetch
