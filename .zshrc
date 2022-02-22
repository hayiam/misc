# exporting 256 colors variable for tmux
export TERM="xterm-256color"

# exporting LANG variable to override system-wide one due to powerlevel9k theme settings
export LANG="en_US.UTF-8"
export LC_COLLATE="C"

# exporting powerlevel9k.zsh-theme and zsh syntax highlighting stuff
source /home/maksim/.config/zsh/powerlevel9k/powerlevel9k.zsh-theme
#source /home/maksim/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# enabling color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

### ARCHIVE EXTRACTION
# usage: unpack <file>
#unpack ()
#{
#  if [ -f $1 ] ; then
#    case $1 in
#      *.tar.bz2)   tar xjf $1   ;;
#      *.tar.gz)    tar xzf $1   ;;
#      *.bz2)       bunzip2 $1   ;;
#      *.rar)       unrar x $1   ;;
#      *.gz)        gunzip $1    ;;
#      *.tar)       tar xf $1    ;;
#      *.tbz2)      tar xjf $1   ;;
#      *.tgz)       tar xzf $1   ;;
#      *.zip)       unzip $1     ;;
#      *.Z)         uncompress $1;;
#      *.tar.xz)    tar xf $1    ;;
#      *.tar.zst)   unzstd $1    ;;      
#      *)           echo "'$1' cannot be extracted via unpack()" ;;
#    esac
#  else
#    echo "'$1' is not a valid file"
#  fi
#}

POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context vcs dir dir_writable)

# adding alias for rm and mv for safety prompt
alias rm='rm -I'
alias mv='mv -i'

# alias for radio stations
alias radio='mpv --no-ytdl --volume=50 --playlist-start=0 ~/misc/stations.m3u'

# alias for network monitor
alias iftop='sudo iftop -i enp0s26u1u4'

# aliases to search in the zsh and notes history
alias grephistory='cat ~/.zsh_history | grep'
alias grepnotes='cat ~/mynotes/notes* ~/mynotes/oldnotes/notes* | grep'

#alias for mount cd-rom
alias cdmount='sudo . mount -t iso9660'
