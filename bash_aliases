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
alias ld='ls -d'   # list directories without listing directory contents

# turn on xhost for ssh sessions
alias ssh='ssh -X -Y'

# Application aliases for both macos and linux
alias ncview='ncview -no_auto_overlay'
alias fack='ack --type=F' # This searches just for .F files using ack.
alias jn='jupyter notebook &'  # This starts the Jupyter Notebook.
alias jl='jupyter lab &'       # This starts the Jupyter Lab interface.
alias jq='jupyter qtconsole &' # This starts iPython in a Jupyter QT console (pretty).

# Machine aliases
alias pleiades='ssh -XY asoto1@pfe'    # ssh into Pleiades at NASA Ames


# The following block are Utility aliases from:
# http://brettterpstra.com//2019/01/15/stuff-ive-made-and-actually-use/

alias cpu='top -o cpu' # the top command sorted for cpu usage
alias mem='top -o rsize' # the top command sorted for memory usage
alias ip="curl icanhazip.com" # Get current external IP
alias cpwd='pwd|tr -d "\n"|pbcopy' # copy the working directory path
# Next, Toggle wifi (add on or off after command)
alias wifi="networksetup -setairportpower en0"
# Next, Use ack to locate TOD* and FIXM* lines in current folder tree
alias todos='ack --nobreak --nocolor "(TODO|FIXME):"|sed -E "s/(.*:[[:digit:]]+):.*((TODO|FIXME):.*)/\2 :>> \1/"|grep -E --color=always ":>>.*:\d+"'
alias ql="qlmanage -px &>/dev/null" # Quick Look a file from Terminal
# Next two, Search running processes for a pattern
alias ps?="ps ax|grep -v grep|grep -iE"
alias psgrep='psgrep -saien'
alias right="printf '%*s' $(tput cols)" # Print argument right aligned


#
# OS specific aliases
#
if [[ $platform == 'osx' ]]; then
    alias gvim='mvim'
    alias vim='mvim -v'
    alias byword='open -a Byword'
    alias gcc='gcc-8'
    alias cc='gcc-8'
    alias g++='g++-8'
    alias c++='c++-8'
    alias nt='open . -a iterm'  # Opening a new iTerm tab with the current directory
    alias glances='glances --disable-bg'
    alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
    alias apm='/Applications/Atom.app/Contents/Resources/app/apm/bin/apm'
elif [[ $platform == 'linux' ]]; then
    alias vim='vi'
    alias gvim='vi'
    if [ "hostname | cut -d"." -f1" == 'eurus' ]; then
       python='/usr/local/anaconda3/bin/python'
       python3='/usr/local/anaconda3/bin/python3' 
    fi
fi




