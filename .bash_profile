# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/root/bin:"{PATH}"
fi

# Change iTerm2 Tab Title dynamically
TABTITLE=`hostname`
echo -e "\033];$TABTITLE\007"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Lazy chmod for web files

alias cmod755='chmod -R 755'
alias cwww='chown -R www-data'

# Bash commands

alias xx='exit;'
alias ..='cd ..'
alias ll='ls -l'
alias cls='clear'
alias tmuxa='tmux attach -d'
alias lll='du -a -h --max-depth=1 | sort -hr'
alias dul='du -sh ./* | sort -hr '

alias where='grep -rl'
alias reload_profile='. ~/.bash_profile; cls'

alias port='fuser -n tcp'
alias kill9='kill -9'
# alias killp='_(){ kill -9 $(ps ux -u lackneets | egrep $1 | awk "{print \$2}"); }; _'
# alias pss='ps ux -u lackneets'

alias wping='wget -q --spider'

# Ubuntu utils
alias memory='watch -n 5 free -m'
alias storage='df -h'

# Tmux shortcut
alias killtab='tmux kill-window -t'


alias silent='_(){ { command="$1 $2 $3 $4 $5 $6 $7 $8;"; command=command | sed -e "s/[\s\n\t\r]*;$//"; $command > /dev/null 2>&1; echo -e "Process Finished \e[100m" $command "\e[0m";  } &  }; _'
alias branch?='_(){ git symbolic-ref HEAD|sed s#refs/heads/##; }; _'

# Path Helpers
alias home='cd ~/'


# Git Add
alias add='git add'
alias add.='git add .'
alias add,='git add .'
alias adda='_(){ add $1 -A; }; _'
alias addall='git add .'

  # Add part
  alias addp='git add -p'
  alias addap='git add . -p'


# Git Common
alias diff='git diff'
alias co='git checkout'
alias ci='git commit'
alias ciam='git commit -am'
alias cim='_(){ git commit -m "[$(branch?)] $1"; };_'
alias st='git status'

alias pull='git pull'
alias pullr='git pull --rebase'
alias push='git push'

alias stash='git stash'
alias merge='_(){ git merge $1 --no-ff -m "[QuickMerge] from $1 to $(branch?) (no-ff)"; }; _'

# Git Reset
alias gitreset='_(){ git reset HEAD^ --$1; }; _'
alias resethead='git reset HEAD'
alias resetorigin='git clean -f -d'

alias pushforce='_(){ git push origin HEAD --force; };_'
alias resethard='_(){ git reset --hard $1; git push origin HEAD --force; };_' #直接還原到某個Commit，沒有任何紀錄

# Git Lazy Helper
alias commit='_(){ cim "$1"; sync; }; _'
alias commitall='add .; commit'
alias commita='commitall'

  # Git Ticket Helper
  alias create='git push origin'

  alias t='_(){ git co ticket$1; }; _'
  alias ticket='_(){ git co ticket$1; }; _'
  alias master='git co master'

  alias newbranch='_(){ git push origin master:$1; git co $1; }; _'
  alias newbranchfrom='_(){ git push origin $1:$2; git co $2; }; _' # newbranchfrom ticket1234 ticket5566
  alias killbranch='_(){ resetorigin; master; git push origin --delete $1; git branch -D $1; }; _'
  alias killthisbranch='_(){ b=`branch?`; killbranch $b; }; _'

  alias newticket='_(){ git push origin master:ticket$1; git co ticket$1; }; _' # newticket 5566
  alias newticketfrom='_(){ git push origin ticket$1:ticket$2; git co ticket$2; }; _' # newticketfrom 1234 5566

  alias killticket='_(){ resetorigin; master; git push origin --delete ticket$1; git branch -D ticket$1; }; _' 


# Rails Helper
alias prec='rake assets:precompile'
alias precp='rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets'

alias railsc='rails c'
alias railscp='rails c -e production'

alias bdi='bundle install'

alias migrate_development='rake db:migrate RAILS_ENV=development'
alias migrate_production='rake db:migrate RAILS_ENV=production'

  #alias thincp='env bill_test=1 thin start -C ./config/thin.yml'
  alias thincp='thin start -C ./config/thin.production.yml'
  alias thinc='thin start -C ./config/thin.yml'
  alias thins='thin stop'

# Cap delpoy
alias deploy='cap deploy'
alias start='cap deploy:start'
alias prod='git co master; cap production deploy'
alias demo='cap demo deploy'
alias beta='cap beta deploy'
alias alpha='cap alpha deploy'
alias deployProd='git co master; cap production deploy'


#apache
alias apache_reload='sudo apachectl graceful'