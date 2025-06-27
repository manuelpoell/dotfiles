export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
ZSH_THEME="manuelpoell"
setopt appendhistory
unsetopt autocd beep

# nvm
if ! command -v brew > /dev/null 2>&1; then
  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else 
  export NVM_DIR="$HOME/.nvm"
  source $(brew --prefix nvm)/nvm.sh
fi

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# fastfetch
fastfetch
