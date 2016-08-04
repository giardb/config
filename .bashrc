#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="emacs -nw"
export USER_NICKNAME="Boris GIARD"
export LOGIN="giard_b"
export PATH=$PATH ":~/scripts"

#Alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ll -a'
alias ne='emacs'
alias rc='ne .config/awesome/rc.lua'
alias xd='xscreensaver-demo'
alias lock='xscreensaver-command --lock'
alias co='wpa_supplicant -iwlo1 -c /etc/wpa_supplicant/wpa_supplicant.conf -B'
alias m7='sudo mount /dev/sda7 ~/mount'
alias tree='tree -C'

#PS1
PS1='\u \W \$: '
