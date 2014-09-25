#!/bin/bash

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

# bash_aliases

# Directory related aliases
alias dir='ls -s'
alias lss='ls -Fs'
alias l='ls -CF'
#alias la='ls -FA'
alias ll='ls -Fl'
#alias ls='ls -F'
alias la='ls -Al'               # show hidden files\
alias lt='ls -ltrh '              # sort by date\
alias lm='ls -al | less'         # pipe through 'less'\

# turn on xhost for ssh sessions
alias ssh='ssh -X'

# Application aliases
alias ncview='ncview -no_auto_overlay'

# Machine aliases
alias pleiades='ssh -X asoto1@pfe'    # ssh into Pleiades at NASA Ames

# ack aliases
alias fack='ack --type=F' # This searches just for .F files.

# OS specific aliases

if [[ $platform == 'osx' ]]; then
	alias gvim='mvim'
    alias vim='vi'
elif [[ $platform == 'linux' ]]; then
	alias gvim='vim'
fi




