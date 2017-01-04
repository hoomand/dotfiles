################################ Functions ##################################################
parse_git_branch () {
  git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
svndiff() {
    svn diff "${@}" | colordiff
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

################################# Exports ###################################################
export PS1="$BLACK[\u@$RED\h $GREEN\W$RED_BOLD\$(parse_git_branch)\$(parse_svn_branch)$BLACK] "
export TERM='xterm-256color'
export SHELL='/bin/bash'
export PATH=$PATH:/usr/local/bin

# If  ssh-agent is not running, run it! 
# or your ssh-add keyfiles are useless
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
fi

# If aws_completer is installed, add it to PATH
AWS_COMPLETER=`which aws_completer 2>&-`
if [[ $? -eq 0 ]]
then
	export PATH=$PATH:$AWS_COMPLETER
	complete -C "$AWS_COMPLETER" aws
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.rbenv" ] ; then
	PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

if [ -d "$HOME/.jenv" ] ; then
    PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi


export EDITOR=vim

# Without HOMEBREW token, most of your `brew` commands
# fail as they go over the API limit for anonymous users
export HOMEBREW_GITHUB_API_TOKEN="bd68b90dc174345d0597014694843eaab055a34d"

################################# Aliases ###################################################
# Global aliases I always need
alias ll="ls -l"

# Include local aliases file.
# Depending which computer I am using, I like to setup different aliases.
# The aliases I need at work are different to those I need at home or in theRaspberry Pi!
if [ -f ~/.aliases ] ; then
    . ~/.aliases
fi

# If 'thefuck' Python utility is installed, add 'fuck' as an alias!
# You can install 'thefuck' by typing 'pip install thefuck'
if hash thefuck 2>/dev/null; then
    eval $(thefuck --alias)
fi
