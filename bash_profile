#!/bin/bash

# bash_profile

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
	platform='osx'
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

declare -a files=(
    $HOME/dotfiles/bash_config    # Configuration
    $HOME/dotfiles/bash_aliases    # Aliases
    $HOME/dotfiles/bash_prompt    # Custom bash prompt
    $HOME/dotfiles/bash_paths    # Path modifications
    $HOME/dotfiles/bash_functions # Short functions for shell work
)

# If these files are readable, source them
for index in ${!files[*]}
do
    if [[ -r ${files[$index]} ]]; then
        source ${files[$index]}
    fi
done

unset files

if [[ $platform == 'osx' ]]; then
#    PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    PROMPT_TITLE='echo -ne "\033]0;[${HOSTNAME%%.*}] ${PWD/#$HOME/~}\007"'
    export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
elif [[ $platform == 'linux' ]]; then
#    PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    PROMPT_TITLE='echo -ne "\033]0:[${HOSTNAME%%.*}] ${PWD/#$HOME/~}\007"'
    export PROMPT_COMMAND="${PROMPT_COMMAND} "
fi

if [[ $platform == 'osx' ]]; then
    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#    . /Users/asoto/Applications/exelis/idl85/bin/idl_setup.bash
fi


if [[ $platform == 'linux' ]]; then
    SSH_ENV="$HOME/.ssh/environment"

    function start_agent {
        echo "Initialising new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        echo succeeded
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" > /dev/null
        /usr/bin/ssh-add;
    }
    
    # Source SSH settings, if applicable
    
    if [ -f "${SSH_ENV}" ]; then
        . "${SSH_ENV}" > /dev/null
        #ps ${SSH_AGENT_PID} doesn't work under cywgin
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
        }
    else
        start_agent;
    fi
    
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/asoto/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/asoto/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/asoto/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/asoto/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
