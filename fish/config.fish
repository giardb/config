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
alias bspwmrc "ne ~/.config/bspwm/bspwmrc"
alias fishrc "ne ~/.config/fish/config.fish"
alias sxhkdrc "ne ~/.config/sxhkd/sxhkdrc"
alias wmkey "cat ~/.config/sxhkd/sxhkdrc"
alias sune "sudo emacs -nw"


#####ALIAS GIT#####
alias add "git add"
alias commit "git commit -am"
alias clone "git clone"
alias pull "git pull"
alias push "git push origin master"

####PROMPT####
function fish_prompt
	 set_color 625721
	 set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	 set -l battery (battery | cut -d' ' -f2)
	 echo -n (whoami)' ['(prompt_pwd)'] ['"$git_branch"'] ['"$battery"'] '
	end

####COLOR_MAN_PAGE####
set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline