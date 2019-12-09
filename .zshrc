. ~/.bash_profile
export ZSH="/Users/justinfuller/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
