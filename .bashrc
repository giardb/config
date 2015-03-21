#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="emacs -nw"
export USER_NICKNAME="Boris GIARD"

#Alias
alias work='cd ~/mount/giard_b/rendu/sys_unix/PSU_2014_minishell1'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ll -a'
alias emacs='emacs -nw'
alias ne='emacs'
alias rc='ne .config/awesome/rc.lua'
alias xd='xscreensaver-demo'
alias lock='xscreensaver-command --lock'
alias co='wpa_supplicant -iwlo1 -c /etc/wpa_supplicant/wpa_supplicant.conf -B'
alias m7='sudo mount /dev/sda7 ~/mount'
alias tree='tree -C'

#PS1
PS1='\u \W \$: '
