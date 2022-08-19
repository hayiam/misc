# exporting 256 colors variable for tmux
export TERM="xterm-256color"

# exporting LANG variable to override system-wide one due to powerlevel9k theme settings
export LANG="en_US.UTF-8"
export LC_COLLATE="C"

# exporting autosuggestions script
source /home/maksim/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /home/maksim/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# setting up history parameters
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# adding ~/.local/scripts to the $PATH
export PATH=/home/maksim/.local/scripts:$PATH

# prevent duplicates in history
export HISTCONTROL=ignoreboth
# export ccache directory path to avoid doubling the cache directory 
# export CCACHE_DIR=/var/cache/ccache

# setup prompt and enable zsh-completion
autoload -U compinit
autoload -Uz vcs_info
precmd() { vcs_info }
compinit

zstyle ':vcs_info:git:*' formats ' %b'

setopt PROMPT_SUBST

PROMPT=$'\ $(if [ -w ${PWD} ]; then echo "%F{yellow}"; else echo "%F{magenta}"; fi) \ %F{yellow}%~$(if [ ${PWD} = "/home/maksim" ]; then echo "/"; fi)\ $(if [[ "${vcs_info_msg_0_}" = " main" || "${vcs_info_msg_0_}" =  " master" ]]; then echo "%F{blue}"; else echo "%F{cyan}"; fi)${vcs_info_msg_0_}$(if [ ! -z "${vcs_info_msg_0_}" ]; then echo "\ "; fi)%F{green}➤\ '

# enabling color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# adding alias for rm and mv for safety prompt
alias rm='rm -I'
alias mv='mv -i'

# alias for radio stations
alias radio='mpv --no-ytdl --volume=50 --playlist-start=0 ~/misc/stations.m3u'

# aliases to search in the zsh and notes history
alias grephistory='cat ~/.zsh_history | grep'
alias grepnotes='cat ~/mynotes/notes* ~/mynotes/oldnotes/notes* | grep'

#alias for mount cd-rom
alias cdmount='sudo mount -t iso9660'

#alias to show cpu and gpu temperature
alias temp="paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'"

#alias to see emerge progress
alias emprog='watch -n 1 sudo qlop -r -H'

#aliases for suspend, shutdown and reboot
alias suspend='loginctl suspend'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
