alias ls="ls -G"
alias ll="ls -l"
alias e="exit"
alias racket="racket -il xrepl"

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export HISTSIZE=10000
export HISTCONTROL=erasedups

shopt -s histappend

PS1='\n[\u@\h:\w \D{%a %H:%M:%S} \j $?]\n$'

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

# Racket
export PATH="/Applications/Racket v6.2.1/bin":$PATH

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Spark
export PATH=$PATH:$HOME/bin/spark/bin

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# OPAM configuration
. /Users/chris/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Rabbit MQ
export PATH=$PATH:/usr/local/sbin



