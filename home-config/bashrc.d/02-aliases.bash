# Garrett's BASH aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ll='ls -alG'
  alias ls='ls -G'
else
  alias ll='ls -al --color=always'
  alias ls='ls --color=always'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pcregrep='pcregrep --color=auto'

# Misc environment variables
export EDITOR=vim

# Git aliases
alias gpum='git pull upstream master -v'
alias gfum='git fetch upstream master -v'
alias gpom='git pull origin master -v'
alias gfom='git fetch origin master -v'
alias glog='git log --all --decorate --oneline --graph -5'

