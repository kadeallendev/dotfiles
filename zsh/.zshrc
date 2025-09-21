# Homebrew setup
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ------------------------------------------------------------------------------
# PLUGINS
# ------------------------------------------------------------------------------

# TODO: Deal with sheldon
# eval "$(sheldon source)"

# # Set zinit directory
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
#
# # Load zinit
# source "${ZINIT_HOME}/zinit.zsh"
#
# # Add zsh plugins
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
# # zinit light Aloxaf/fzf-tab
#
# # Load completions
# autoload -U compinit && compinit
# zinit cdreplay -q

# ------------------------------------------------------------------------------
# VARIABLES
# ------------------------------------------------------------------------------

# Stop homebrew always updating before installing package
export HOMEBREW_NO_AUTO_UPDATE=1

# Use nvim as man pager
export MANPAGER="nvim +Man!"

# GPG Signing
# export GPG_TTY=$(tty)

# Add homebrew share
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/opt/homebrew/share"

# Editor and terminal
export EDITOR=nvim
export TERM=xterm-256color

# Fzf shit
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,venv
--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------

# Git
alias gl="git log"
alias glo="git log --oneline"
alias gs="git status"
alias gc="git commit"

# tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"

# Home dir
alias ~="cd ~"

# Exa
# alias ls="exa -Fl --sort=ext"
# alias ls="eza -lh --sort=ext"
# alias lsa="eza -ha --sort=ext"
# alias lsa="exa -Fa --sort=ext"

# Editing zsh config files
alias ezsh="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"

# Auto cd ..
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Kill sessions
tmux_kill() {
	tmux list-sessions |\
		cut -d':' -f1 |\
		fzf --multi --prompt 'Select sessions: ' --color=bw |\
		xargs -I {} sh -c 'tmux kill-session -t {} && echo "Killed {}"'
}
alias tkill="tmux_kill"

# ------------------------------------------------------------------------------
# KEYBINDINGS
# ------------------------------------------------------------------------------

bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ------------------------------------------------------------------------------
# HISTORY
# ------------------------------------------------------------------------------

HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ------------------------------------------------------------------------------
# ZSH SPECIFIC
# ------------------------------------------------------------------------------

zstyle ':completion:*' menu no

# ------------------------------------------------------------------------------
# FUNCTIONS
# ------------------------------------------------------------------------------


function otw() {
  game=$(echo $1 | tr -d '[:digit:]')
  ssh -p 2220 "${1}@${game}.labs.overthewire.org"
}

# Shell integrations
eval "$(fzf --zsh)"

# Load starship prompt
# NOTE: Disable for new mac
# eval "$(starship init zsh)"

# Load syntax highlighting
source $(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh completions
fpath=($(brew --prefix zsh-completions)/share/zsh-completions $fpath)
autoload -U compinit && compinit

# Load ZSH auto suggestions
source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

