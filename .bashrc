# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#History SIZE and options
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi



# User specific environment and startup programs
LANG=en_US.UTF-8 
LOCALE=UTF-8
PATH=$PATH:$HOME/bin
PATH=$PATH:/sbin:/usr/sbin

PS1="[\u@\h \W]\$"

#EDITOR
export EDITOR=vim

# MISC
#kubernetes
alias k=kubectl
complete -F __start_kubectl k

## Shorcut to calc
? () { echo "$*" | bc -l ; }

## List files with pattern
ftext () {
  grep -iIHrn --color=always "$1" . | less -R -r
}

## Whois AS ip range
ASiprange() {
  ASNUMBER=$1
  #whois -h whois.radb.net -- '-i origin' $ASNUMBER | grep -Eo "([0-9.]+){4}/[0-9]+"
  echo '!g'$ASNUMBER|nc whois.radb.net 43 | grep -Eo "([0-9.]+){4}/[0-9]+"
}

export PATH PS1 LANG LOCALE
