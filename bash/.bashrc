# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*)     ;;
*)       return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color |   *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*)  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto -Xlah'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
PATH=$HOME/.local/bin/aws-mfa:$PATH
export COMPOSE_IGNORE_ORPHANS=true
export AWS_SDK_LOAD_CONFIG=true
alias aws-mfa="aws-mfa --profile default"
alias aws-mfa="aws-mfa --profile default"

# ---- Kade's Section ----

# Options
export EDITOR=nvim

# Fzf shit
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,venv
--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS="
--height 40% --layout=reverse
--color=fg+:#E0E2EA,info:#FFC0B9,spinner:#A6DBFF,bg+:#4F5258,pointer:#FCE094,hl:#FCE904,bg:#14161B,fg:#E0E2EA,prompt:#B4F6C0,marker:#FCE094,header:#A6DBFF,hl+:#FCE904
"

export PATH="$PATH:/home/kade/slides"

export PATH="$PATH:/home/kade/zig"

export PATH="$PATH:/mnt/c/Users/kade.allen/bin"

# Use neovim as manpager
export MANPAGER="nvim +Man!"

# GPG signing
export GPG_TTY=$(tty)

# Aliases

# Git
alias gl="git log"
alias glo="git log --oneline"
alias gs="git status"
alias gc="git commit"
alias gcl="git clone"

# Tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"

# Home dir
alias ~="cd ~"

# Ls
alias ls="ls -Xlh --color=auto --group-directories-first"
alias lsa="ls -Xlha --color=auto --group-directories-first"

# Auto cd ..
alias ..="cd .."
alias ...="cd ../.."

# GPG RELAY
~/.local/bin/gpg-relay
export KEYID=$(gpg --list-secret-keys --keyid-format=long | grep 'sec.*\[C\]' | head -n 1 | awk '{print $2}' | cut -d'/' -f2)

# -------
# Methods
# -------

# Custom cd method to use fzf
cd() {
	if [ $# -eq 0 ]; then
		# No arguments, use fd an fzf
		selected_dir=$(fd --type directory | fzf)
		if [ -n "$selected_dir" ]; then
			builtin cd "$selected_dir"
		fi
	else
		# Arguments provided, use regular cd
		builtin cd "$@"
	fi
}

# Over the wire function
function otw() {
	game=$(echo $1 | tr -d '[:digit:]')
	ssh -p 2220 "${1}@${game}.labs.overthewire.org"
}

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
