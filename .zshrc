# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
#ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="passion"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting ruby dotenv macos)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=$(whoami)

# change default auto suggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# NodeJS Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Ruby Rbenv
if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

#fortune -a | cowsay -f `cowsay -l | tail -n +2 | tr " " "\n" | sort -R | head -n 1`

# Run local aliases for this computer if any
[[ -s "$HOME/.aliases.sh" ]] && source "$HOME/.aliases.sh"

# Run local env variables for this computer
[[ -s "$HOME/.envvars.sh" ]] && source "$HOME/.envvars.sh"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Python rbenv
PATH=$(pyenv root)/shims:$PATH

# Java SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


