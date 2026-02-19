export PATH=$PATH:$HOME/Library/Python/3.9/bin

v() {
	ls -Glah $argv;
}
u() {
	cd .. $argv;
}
c() {
	cd ~/code
}

t() {
	if [[ -z "$1" ]]; then
		tmux ls
	else
		if [[ -z "$TMUX" ]]; then
			tmux attach -t "$1" 2>/dev/null || tmux new -s "$1"
		else
			tmux switch-client -t "$1"
		fi
	fi
}
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true

# Define dirty markers
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'

# IMPORTANT: include %u and %c
zstyle ':vcs_info:git:*' formats ' (%b%c%u)'

setopt PROMPT_SUBST

PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f %# '
