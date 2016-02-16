#!/usr/bin/env zsh

# only do this if we're in an interactive shell
[[ -o interactive ]] || return

# get $EPOCHSECONDS. builtins are faster than date(1)
zmodload zsh/datetime || return

# make sure we can register hooks
autoload -Uz add-zsh-hook || return

# initialize it because otherwise we compare a date and an empty string
# the first time we see the prompt. it's fine to have lastcmd empty on the
# initial run because it evaluates to an empty string, and splitting an
# empty string just results in an empty array.
zbell_timestamp=$EPOCHSECONDS

# right before we begin to execute something, store the time it started at
zbell_begin() {
        zbell_timestamp=$EPOCHSECONDS
        zbell_lastcmd=$1
}

# when it finishes, if it's been running longer than $zbell_duration,
# and we dont have an ignored command in the line, then print a bell.
zbell_end() {
        proc=`echo $zbell_lastcmd|cut -d' ' -f1`
        duration=$(( $EPOCHSECONDS - $zbell_timestamp ))
        result=`echo $?`

        sudo salt-call event.send "cmd/$proc/return" process="$proc" duration="$duration" result="$result" &
}

# remove existing hooks
add-zsh-hook -d preexec zbell_begin
add-zsh-hook -d precmd zbell_end

# register the functions as hooks
add-zsh-hook preexec zbell_begin
add-zsh-hook precmd zbell_end
