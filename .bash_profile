[ -f /etc/profile ] && . /etc/profile
[ -f ~/.bashrc ]    && . ~/.bashrc

source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/erlang

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
