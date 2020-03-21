# If you come from bash you might have to change your $PATH.
DEFAULT_USER=$(whoami)
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$DEFAULT_USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git zsh-autosuggestions ruby dotenv osx)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# autosuggest plugin highlight for darker themes
# colors list: https://coderwall.com/p/pb1uzq/z-shell-colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=094'
fortune -a | cowsay -f `cowsay -l | tail -n +2 | tr " " "\n" | sort -R | head -n 1`