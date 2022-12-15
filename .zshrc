# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# List of oh-my-zsh plugins to load.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Loading fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Using pure prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
zstyle ':prompt:pure:path' color 051
zstyle :prompt:pure:prompt:success color '#DFAFAF'
prompt pure

# Customize colors on the terminal
[[ -s "$HOME/grc/grc.zsh" ]] && source $HOME/grc/grc.zsh

# Custom aliases
alias disable_zsh_history='unset HISTFILE'
