export GOPATH=$HOME/go
export PATH=$PATH:$HOME/bin:/usr/local/bin:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER=$(whoami)

# change default auto suggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# NodeJS Version Manager
export NVM_DIR="$HOME/.nvm"

if command -v brew 1>/dev/null 2>&1; then
  [ -s $(brew --prefix nvm)/nvm.sh ] && . "$(brew --prefix nvm)/nvm.sh"
fi


# Ruby Rbenv
if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi


if command -v cowsay 1>/dev/null 2>&1; then
  fortune -a | cowsay -f `cowsay -l | tail -n +2 | tr " " "\n" | sort -R | head -n 1`
fi

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  PATH=$(pyenv root)/shims:$PATH
fi


# Java SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



################# Do NOT Add Below This Line ###################
# Run local overrides for this computer if any
[[ -s "$HOME/.shelloverrides.sh" ]] && source "$HOME/.shelloverrides.sh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ruby dotenv macos)
source $ZSH/oh-my-zsh.sh
