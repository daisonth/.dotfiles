#!/bin/bash

# --print-query is used to run a custom command when none of the list is
# selected.
OPTS='--info=inline --print-query --bind=ctrl-space:print-query,tab:replace-query'

exec swaymsg -q "exec --no-startup-id $(compgen -c | fzf $OPTS | tail -1)"
