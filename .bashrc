# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

. "$HOME/.local/bin/env"

# Bitwarden
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
alias restart-bitwarden="pkill -f bitwarden-app; sleep 2; nohup /opt/bitwarden/Bitwarden.AppImage > /dev/null 2>&1 & disown"

# dotfiles repository
alias dotfiles='git --git-dir=/home/lukas/.dotfiles/ --work-tree=/home/lukas'

eval "$(starship init bash)"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/key-bindings.bash

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# git
alias gs='git status -sb'
alias gl='git log --all --decorate --oneline --graph'
alias gp='git push'
alias gi='git init -b main'
alias gau='git add -u'
alias gap='git add -p'
alias gds='git diff --staged'
alias gcm='git commit -m'

# C++
# alias g++='g++ -std=c++23 -Wall -Werror -Wpedantic -Wconversion -Wshadow'

# Java
alias javac='javac -Xlint:all -Werror'

# Tailscale Exit Node
alias vpn-on='sudo tailscale set --exit-node=general-use-instance'
alias vpn-off='sudo tailscale set --exit-node='
