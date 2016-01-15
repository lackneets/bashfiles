# OPTIONS
set bell-style=visual
set nobeep

# man bash
HISTFILESIZE=5000
HISTSIZE=5000

# VARIABLES
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:"{PATH}"
# my default editor
export EDITOR="vim"
export PAGER="less"
export GIT_PAGER="less"
export BLOCKSIZE="k"
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LC_CTYPE=zh_TW.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LANG=zh_TW.UTF-8
export LC_TIME=en_US.UTF-8
export TERM="xterm-256color"
# colorful output for GNU ls = coloring by extension:
export LS_COLORS='no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.jpg=1;32:*.jpeg=1;32:*.JPG=1;32:*.gif=1;32:*.png=1;32:*.jpeg=1;32:*.ppm=1;32:*.pgm=1;32:*.pbm=1;32:*.c=1;33:*.C=1;33:*.h=1;33:*.cc=1;33:*.awk=1;33:*.pl=1;33:*.gz=1;31:*.tar=1;31:*.zip=1;31:*.lha=1;31:*.lzh=1;31:*.arj=1;31:*.tgz=1;31:*.taz=1;31:*.html=1;34:*.htm=1;34:*.doc=1;34:*.txt=1;34:*.o=1;36:*.a=1;36'
# HISTORY:
# don't add common commands to the history:
export HISTIGNORE="bg:cd:date:df:du:exit:fg:ll:ls:pwd:rehash:source:top:w"

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export LC_ALL="en_US.UTF-8"

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# for different OS
operatesystem=$(uname)

case $operatesystem in
  "Linux")
    alias ls='ls -aF --color'
    alias ll='ls -al --color | less -r'
    alias grep="/bin/grep --color"
    alias g="/bin/grep --color"
    alias fixlocale="sudo locale-gen --lang zh_TW.UTF-8;sudo locale-gen;"
    ;;
  "Darwin")
    alias ls="ls -aFG"
    alias ll='ls -alG --color | less -r'
    alias grep="/usr/bin/grep --color"
    alias py="/usr/local/Cellar/python3/3.2.1/bin/python3"
    ;;
  "FreeBSD")
    alias ls="ls -aFGg"
    alias ll="ls -aGg | less -r"
    alias grep="/usr/bin/grep --color"
    ;;
esac

# PROMPT
# more info:
# bash manual, section PROMPTING
# $ man bash
# /^PROMPTING
#
# for the prompt there are quite a few 
# backslash-escaped special characters:
#       \@!#$[] ADHTVW adehjlnrstuvw
# here are the most commonly used ones:
# \u    username
# \h    hostname (without the domain)
# \H    full hostname, ie with domain
# \v    version (short)
# \V    version + patch level
# \w    full working directory
# \W    basename of working directory

force_color_prompt=yes
if [ ! ${WINDOW} ]; then
    PS1="\[\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h \[\e[0m\][\[\e[32m\]\w\[\e[0m\]] (\[\e[36m\]\A\[\e[0m\])\[\e[0m\] \[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]\n$ "
else
    #PS1="\[\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h \[\e[0m\][\[\e[32m\]\w\[\e[0m\]] (\[\e[36m\]\A\[\e[0m\]/\[\e[36m\]W${WINDOW}\[\e[0m\]]\[\e[0m\] "
    PS1="\[\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h \[\e[0m\][\[\e[32m\]\w\[\e[0m\]] \[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]\n$ "
fi

if [ "$TERM" == "vt100" ] || [ "$TERM" == "ansi" ]; then
 LANG=zh_TW.big5
fi

export PYTHONPATH=~/lib/python2.7/site-packages
export PATH=~/bin:$PATH
