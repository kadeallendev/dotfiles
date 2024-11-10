set -x

# Homebrew setup
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -----------------
# PLUGINS
# -----------------

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

# Variables
# Stop homebrew always updating before installing package
export HOMEBREW_NO_AUTO_UPDATE=1

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# psql
export PATH="$PATH:/opt/homebrew/opt/postgresql@16/bin"
# Temporary binaries
export PATH="$PATH:/tmp/bin"

# Python stuff, mainly for mdformat
export PATH="$PATH:/Users/kadeallen/Library/Python/3.9/bin"

# Add PDFLatex to path
export PATH="$PATH:/Library/Tex/texbin"

# Add dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"

export EDITOR=nvim
export TERM=xterm-256color

# PJ file
export PJ_FILE=/Users/kadeallen/.pj

# Ledger file
export LEDGER_FILE=/Users/kadeallen/vault/areas/ledger/ledger.journal

# Aliases
# tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"


# Home dir
alias ~="cd ~"

# Exa
# alias ls="exa -Fl --sort=ext"
alias ls="eza -l --sort=ext"
alias lsa="eza -a --sort=ext"
# alias lsa="exa -Fa --sort=ext"

# Uni
alias cdtri="cd ~/School/2024/"
alias ai="cd ~/School/2024/COMP\ 307/"
alias cg="cd ~/School/2024/CGRA\ 354/"
alias db="cd ~/School/2024/SWEN\ 304"
alias sf="cd ~/School/2024/SWEN\ 326"
alias ml="cd ~/School/2024/COMP\ 309"
alias 3d="cd ~/School/2024/CGRA\ 350"
alias sb="cd ~/School/2024/SWEN\ 301"
alias cr="cd ~/School/2024/CYBR\ 372"

# Obsidian vault
alias obs="cd ~/Documents/vault/"

# Editing config files
alias ezsh="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias etmux="nvim ~/.tmux.conf"
alias envim="nvim ~/.config/nvim"

# Auto cd ..
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#java
alias java22="/opt/homebrew/Cellar/openjdk/22.0.2/bin/java"

# List downloads
alias lsd="eza ~/downloads -lr --sort=created"

# Fzf shit
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,venv
--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

# Keybindings
# TODO: look for vim mode
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
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

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no


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

# PDF Join
joinpdf() {
    #/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join -o output.pdf files.pdf
}

# Source my scripts
source ~/.local/scripts/pj


# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Shell integrations
eval "$(fzf --zsh)"

# Load starship prompt
eval "$(starship init zsh)"

# Load syntax highlighting
source $(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh completions
fpath=($(brew --prefix zsh-completions)/share/zsh-completions $fpath)
autoload -U compinit && compinit

# Load ZSH auto suggestions
source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


set +x
