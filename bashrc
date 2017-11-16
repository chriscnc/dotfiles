alias ls="ls -G"
alias ll="ls -l"
alias e="exit"
#alias racket="racket -il xrepl"
#alias gr="gracket"
alias vi="vim"
#alias sml="rlwrap sml"
#alias typed-racket="racket -I typed/racket"

#export TERM=xterm-256color
#export CLICOLOR=1
export HISTSIZE=10000
export HISTCONTROL=erasedups

shopt -s histappend

PS1='\n[\u@\h:\w \D{%a %H:%M:%S} \j $?]\n$'

#export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/bin

# Racket
export PATH="/Applications/Racket v6.11/bin":$PATH

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Spark
export PATH=$PATH:$HOME/bin/spark/bin

# pyenv
#export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# julia
#export PATH=$PATH:/Applications/Julia-0.6.app/Contents/Resources/julia/bin


# bash function to cd directly to a project root from anywere in the project
# tree
cdp () {
  cd `git rev-parse --show-toplevel`
}
