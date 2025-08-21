# export PS1="%{%F{9}%}%~ %{%F{14}%}%% %{%f%}"
export PS1="%{%F{14}%}%~ %{%F{13}%}> %{%f%}"
# export RPROMPT="%{%F{13}%}[$SHELL]%{%f%}"
export EDITOR="/opt/homebrew/bin/nvim"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/bin:$PATH"
set -o vi

zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
autoload -Uz compinit && compinit

export HISTSIZE=11000

zstyle ':completion:*:*:ssh:*' users ''
hosts=(${(f)"$(awk '/^Host / {print $2}' ~/.ssh/config ~/.ssh/known_hosts 2>/dev/null)"})
zstyle ':completion:*:*:ssh:*' hosts $hosts

# basic aliases
alias r="source $HOME/.zshrc && clear"
alias ls="ls -GF"
alias ll="ls -GFl"
alias la="ls -GFa"
alias nv="nvim"
alias fetch="fastfetch" 
alias nmutt="neomutt"
alias brewup="brew update && brew upgrade && brew cleanup"
alias lsblk="echo 'diskutil list' && diskutil list"

# start sshd on mac
alias sshdstart="sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
alias sshdstop="sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist"

# one word to edit config files 
alias zshrc="nvim $HOME/.zshrc"
alias ghcfg="nvim $HOME/.config/ghostty/config"
alias nvcfg="nvim $HOME/.config/nvim/init.lua"
alias nmrc="nvim $HOME/.muttrc"
