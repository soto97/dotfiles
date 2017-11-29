#!/bin/bash
#
#
# bash_aliases
#
#


platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

#
# Directory related aliases
#
alias dir='ls -s'
alias lss='ls -Fs'
alias l='ls -CF'
#alias la='ls -FA'
alias ll='ls -Fl'
#alias ls='ls -F'
alias la='ls -Al'               # show hidden files\
alias lt='ls -ltrh '              # sort by date\
alias lm='ls -al | less'         # pipe through 'less'\

#
# turn on xhost for ssh sessions
#
alias ssh='ssh -X -Y'

#
# Application aliases
#
alias ncview='ncview -no_auto_overlay'

#
# Machine aliases
#
alias pleiades='ssh -XY asoto1@pfe'    # ssh into Pleiades at NASA Ames

#
# ack aliases
#
alias fack='ack --type=F' # This searches just for .F files.

#
# Jupyter aliases
#
alias jn='jupyter notebook &'  # This starts the Jupyter Notebook.

#
# OS specific aliases
#
if [[ $platform == 'osx' ]]; then
    alias gvim='mvim'
    alias vim='vi'
elif [[ $platform == 'linux' ]]; then
    alias vim='vi'
    alias gvim='vi'
fi




