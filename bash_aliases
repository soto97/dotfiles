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
alias ld='ls -d'   # list directories without listing directory contents

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
alias jl='jupyter lab &'       # This starts the Jupyter Lab interface.

#
# Utility aliases 
# from http://brettterpstra.com//2019/01/15/stuff-ive-made-and-actually-use/
#

# Aliases for the top command.
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Get current external IP
alias ip="curl icanhazip.com"

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Toggle wifi (add on or off after command)
alias wifi="networksetup -setairportpower en0"

# Use ack to locate TOD* and FIXM* lines in current folder tree
alias todos='ack --nobreak --nocolor "(TODO|FIXME):"|sed -E "s/(.*:[[:digit:]]+):.*((TODO|FIXME):.*)/\2 :>> \1/"|grep -E --color=always ":>>.*:\d+"'

# Quick Look a file from Terminal
alias ql="qlmanage -px &>/dev/null"

# Search running processes for a pattern
alias ps?="ps ax|grep -v grep|grep -iE"
alias psgrep='psgrep -saien'

# Print argument right aligned
alias right="printf '%*s' $(tput cols)"


#
# OS specific aliases
#
if [[ $platform == 'osx' ]]; then
    alias gvim='mvim'
    alias vim='vi'
    alias byword='open -a Byword'
    alias gcc='gcc-8'
    alias cc='gcc-8'
    alias g++='g++-8'
    alias c++='c++-8'
    alias nt='open . -a iterm'  # Opening a new iTerm tab with the current directory
elif [[ $platform == 'linux' ]]; then
    alias vim='vi'
    alias gvim='vi'
fi




