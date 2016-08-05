#!/bin/sh

for i in .*; do
    case $i in
	.)
	;;
	..)
	;;
	.gitignore)
	;;
	*)
	    ln -s ${PWD}/${i} ${HOME}/${i}
	    ;;
    esac
done




