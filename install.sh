#!/bin/sh

for i in .*; do
    case $i in
	.)
	;;
	..)
	;;
	.gitignore)
	;;
	.git)
	;;
	*)
	    ln -s ${PWD}/${i} ${HOME}/${i}
	    ;;
    esac
done




