set fish_greeting

#####VAR ENV#####
set -gx EDITOR "emacs -nw"
set -gx USER_NICKNAME "Boris GIARD"
set -gx LOGIN "giard_b"
set -gx GOPATH $HOME/projet/go
set -gx PATH $GOPATH $PATH

#####ALIAS#####
alias emacs "emacs -nw"
alias ne "emacs -nw"
alias co "wpa_supplicant -iwlo1 -c /etc/wpa_supplicant/wpa_supplicant.conf -B"
alias rc "ne ~/.config/bspwm/bspwmrc"
alias fishrc "ne ~/.config/fish/config.fish"
alias wmkey "cat ~/.config/sxhkd/sxhkdrc"

#####ALIAS GIT#####
alias gitad "git add"
alias gitco "git commit -am"
alias gitcl "git clone"
alias gitpl "git pull"
alias gitpu "git push origin master"
alias gitst "git status"

####PROMPT####
function fish_prompt
	 set_color 625721
	 set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	 echo -n (whoami)' ['(prompt_pwd)'] ['"$git_branch"'] '
	end

####COLOR_MAN_PAGE####
set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline