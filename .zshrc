#Time startup: (uncomment last line as well)
# zmodload zsh/zprof

source ~/.zplug/init.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=50000
SAVEHIST=50000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ebygd/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92 :
# only check zcompdump once a day to reduce delay:
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

#LINES FROM https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
#add git support
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%B%n%b%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# %B and %b for bold
PROMPT='%F{green}%n%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f%F{green} >%f%F{blue}>%f%f%F{red}>%f '

####################
# Add to Path:
path+=('/home/ebygd/.local/bin')
path+=('/home/ebygd/go')
path+=('/home/ebygd/go/bin')
export PATH


alias l="ls -latr --color=auto"
alias ls="ls -tr --color=auto"
alias systemctllist="systemctl list-units --type=service"
alias grep="grep --color=auto"

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=/home/ebygd/.dotfiles/ --work-tree=/home/ebygd'

# temp alias for dat500
alias dat500start="echo 'docker start '$'(docker ps -aq)'"
alias dat500stop="echo 'docker stop '$'(docker ps -q)'"
alias dat500commands="lvim ~/uis/master/dat500-2023/dis_materials/sandbox-setup_docker.txt"
# CLEAR ALL CONTAINERS EXCEPT THE ONES NEEDED FOR DAT500
alias dat500clear="docker rm $(docker ps -a | grep -v "datanode" | grep -v "historyserver" | grep -v "resourcemanager" | grep -v "nodemanager" | grep -v "namenode" | grep -v "docker-hadoop-hue-1" | grep -v "spark-master" | grep -v "spark-worker" | awk 'NR>1 {print $1}')"




bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word


###################### PLUGINS ######################

export NVM_NO_USE=true
zplug "lukechilds/zsh-nvm"



export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

# Time startup:
# zprof

alias files='nautilus'
