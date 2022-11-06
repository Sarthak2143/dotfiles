[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s cmdhist
shopt -s globstar
shopt -s histappend
shopt -s histverify

## Configure bash history.
if [ "$(id -u)" = "0" ]; then
	export HISTFILE="$HOME/.bash_root_history"
else
	export HISTFILE="$HOME/.bash_history"
fi
export HISTSIZE=4096
export HISTFILESIZE=16384
export HISTCONTROL="ignoreboth"

## cursor
printf '\e[4 q'

## Colored output.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto -h'

## Replace 'ls' with 'exa' (if available) + some aliases.
if [ -n "$(command -v exa)" ]; then
	alias l='exa'
	alias ls='exa'
	alias l.='exa -d .*'
	alias la='exa -a'
	alias ll='exa -Fhl'
	alias ll.='exa -Fhl -d .*'
else
	alias l='ls --color=auto'
	alias ls='ls --color=auto'
	alias l.='ls --color=auto -d .*'
	alias la='ls --color=auto -a'
	alias ll='ls --color=auto -Fhl'
	alias ll.='ls --color=auto -Fhl -d .*'
fi

## Safety.
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'

# adding alias for commit
alias commit='cd ~/src/commitsXD && bash commit.sh && cd ..'

# adding colors to go test
go_test() {
  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'

# clearing the console
clear
