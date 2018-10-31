#Use emacs key bindings
bindkey -e

#Load Antibody
source <(antibody init)
antibody bundle < ~/.zsh/zsh_plugins.txt

# Faster static loading
#source ~/.zsh/zsh_plugins.sh

#Setup basic ZSH options
HISTSIZE=100
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt extendedglob

#Setup tab-completion
fpath=(~/.zsh/completion $fpath)

#autoload -Uz compinit && compinit -i
#refresh cache every 24 hours
autoload -Uz compinit 
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;
zstyle ':completion:*' menu select

#Declare our keybindings
bindkey -M emacs '^[[A' history-substring-search-up     # Up Arrow: Triggers history substring match backwards (later)
bindkey -M emacs '^[[B' history-substring-search-down   #Down Arrow: Triggers history substring match forwards (earlier)
