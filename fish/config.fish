set fish_greeting
set -gx EDITOR "emacs -nw"
set -gx USER_NICKNAME "Boris GIARD"
set -gx PAGER "most"
set -gx PANEL_FIFO "tmp/panel_fifo"

alias emacs "emacs -nw"
alias ne "emacs -nw"
alias co "wpa_supplicant -iwlo1 -c /etc/wpa_supplicant/wpa_supplicant.conf -B"
alias rc "ne ~/.config/bspwm/bspwmrc"
alias fishrc "ne ~/.config/fish/config.fish"

function fish_prompt
	 set_color 625721
	 set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	 echo -n (whoami)' ['(prompt_pwd)'] ['"$git_branch"'] '
	end

####FISHLINE####
#set FLINE_PATH $HOME/.config/fish/fishline
#source $FLINE_PATH/fishline.fish
#set FLINE_PROMPT STATUS USERHOST PWD GIT N ARROW
#set FLCLR_USERHOST_BG 444

#function fish_prompt
#fishline $status
#end