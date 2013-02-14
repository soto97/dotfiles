#!/bin/bash

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
alias ssh='ssh'

# Application aliases
alias gvim='mvim'
alias ncview='ncview -no_auto_overlay'

# Machine aliases
alias sierra='ssh asoto@sierra.gps.caltech.edu'  # ssh into sierra at GPS at Caltech
alias pleiades='ssh asoto1@pfe'    # ssh into Pleiades at NASA Ames

