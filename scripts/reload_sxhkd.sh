#!/bin/sh

killall sxhkd
sxhkd -c .config/sxhkd/sxhkdrc >> .outputError &

