#!/bin/bash

SESSIONNAME="$HOSTNAME"

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]; then
    tmux new-session -s $SESSIONNAME -n "wkspc0" -d \; \
        split-window -v -t 0 -p 15 -d \; \
        split-window -h -t 0 \; \
        new-window -n "wkspc1" \; \
        split-window -h -t 1 \; \
        select-pane -t :.0 \; \
        select-window -t 0 \; \
        select-pane -t :.0
fi

tmux attach -t $SESSIONNAME -d
