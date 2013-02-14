#!/bin/bash

# bash_profile


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

declare -a files=(
    $HOME/dotfiles/bash_config    # Configuration
    $HOME/dotfiles/bash_aliases    # Aliases
    $HOME/dotfiles/bash_prompt    # Custom bash prompt
    $HOME/dotfiles/bash_paths    # Path modifications
)

# If these files are readable, source them
for index in ${!files[*]}
do
    if [[ -r ${files[$index]} ]]; then
        source ${files[$index]}
    fi
done

unset files
