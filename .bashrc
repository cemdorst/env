
# .bash_profile

# User specific environment and startup programs

LANG=en_US.UTF-8 
LOCALE=UTF-8
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el6_7.x86_64
PATH=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el6_7.x86_64/bin:$PATH
PATH=$PATH:$HOME/bin
PATH=$PATH:/sbin:/usr/sbin

PS1="[\u@\h \W]\$"

#EDITOR
export EDITOR=vim

# MISC
## Send gnome notification when command is done running
remind-me () { time $* ; notify-send -u critical -t 0 "$*" "Command $* has finished!" ; }

## Shorcut to calc
? () { echo "$*" | bc -l ; }

sl () {
    /bin/ls -lF "$@" \
    | sed -r ': top; s/. ([0-9]+)([0-9]{3}[,0-9]* \w{3} )/ \1,\2/ ; t top'
}

#History SIZE and options
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%F %T "

export PATH PS1 JAVA_HOME LANG LOCALE
