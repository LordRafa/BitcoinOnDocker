#!/bin/bash

if [ ! -f "$HOME/.bashrc" ]; then

  cat <<EOF > "$HOME/.bashrc"
HISTSIZE=
HISTFILESIZE=
PS1='\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..="cd .."
source /etc/profile.d/bash_completion.sh
EOF

fi

# Default to 'bitcoind' if no arguments are provided
args="$@"
if [ -z "$args" ]; then
  args="bitcoind --printtoconsole"
fi

exec $args
