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

export PS1="$BLACK[\u@$RED\h $GREEN\W$RED_BOLD\$(parse_git_branch)\$(parse_svn_branch)$BLACK] "
export TERM='xterm-256color'
export PATH=$PATH:vendor/bin

AWS_COMPLETER=`which aws_completer`
if [[ $? -eq 0 ]]
then
	export PATH=$PATH:$AWS_COMPLETER
	complete -C "$AWS_COMPLETER" aws
fi

export HOMEBREW_GITHUB_API_TOKEN="bd68b90dc174345d0597014694843eaab055a34d"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*




alias ll="ls -l --color"
alias subl="/home/bijan/bin/SublimeText2/sublime_text"
