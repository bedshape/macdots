# export PS1="%{%F{9}%}%~ %{%F{11}%}%% %{%f%}"
export PS1="%{%F{9}%}%~ %{%F{11}%}> %{%f%}"
# export RPROMPT="%{%F{13}%}[$SHELL]%{%f%}"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export BED="$HOME/bed"
export UNI="$HOME/uni"
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

alias ls="ls -GF"
alias ll="ls -GFl"
alias la="ls -GFa"
alias lla="ls -GFla"
alias nv="nvim"
alias zshrc="nvim $HOME/.zshrc"
alias nvcfg="nvim $HOME/.config/nvim/init.lua"
alias ghcfg="nvim $HOME/.config/ghostty/config"
alias r="source $HOME/.zshrc && clear"
alias fetch="fastfetch" 
alias sshdstart="sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
alias sshdstop="sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist"
alias mountsync="sudo mount -t nfs 10.241.247.2:/mnt/nasraid/sync $HOME/nfs/sync"
alias mountmedia="sudo mount -t nfs 192.168.1.228:/mnt/nasraid/media $HOME/nfs/media"
alias brewup="brew update && brew upgrade && brew cleanup"
alias rccp="rclone copy -P"
alias rclsd="rclone lsd"
alias rcls="rclone ls"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
