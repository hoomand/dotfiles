# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.toolbox/bin:$HOME/Code/aws/HoomandbMisc/src/HoomandbMisc/scripts/osx_utils:$HOME/.rbenv/bin:$PATH:

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

DEFAULT_USER=$(whoami)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NodeJS Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Ruby Rbenv
eval "$(rbenv init -)"

export JAVA_HOME=$(/usr/libexec/java_home)

fortune -a | cowsay -f `cowsay -l | tail -n +2 | tr " " "\n" | sort -R | head -n 1`

# Java SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python rbenv
PATH=$(pyenv root)/shims:$PATH
