# Use neovim as editor
export EDITOR=nvim

# -------
# Aliases
# -------

# Tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"

# Home dir
alias ~="cd ~"

# Ls
alias ls="ls -l"
alias lsa="ls -la"

# Auto cd ..
alias ..="cd .."
alias ...="cd ../.."

# ------
# Options
# ------

# Fzf shit
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target,venv
--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

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




# Load starship
eval "$(starship init bash)"
