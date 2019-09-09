#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
files="bashrc bash_profile inputrc vimrc vim gitignore_global gitconfig ackrc condarc"  # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"
echo " "

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"
echo " "

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
echo "Moving any existing dotfiles from ~ to $olddir"
    mv -f ~/.$file ~/dotfiles_old/
	echo " "
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
	echo " "
done

# For some reason, I get a recursive vim directory in dotfiles.
# This line removes the recursive vim directory.
# Yes, it's a kludge. Deal with it.
rm $dir/vim/vim

echo "Making sure I have all of the Vim plugins installed."
# Now make sure I have all of the vim plugins that I use.
if [ ! -d "$dir/vim/bundle" ]; then
    mkdir "$dir/vim/bundle"
fi

bundle_dir="$dir/vim/bundle"

# First check for the plugin manager Vundle. Git clone it
# if I don't already have it.
if [ ! -d "$dir/vim/bundle/Vundle.vim" ]; then
    cd $bundle_dir
    git clone git@github.com:VundleVim/Vundle.vim.git
    echo "Vundle installed"
fi

# An indenting plugin.
if [ ! -d "$dir/vim/bundle/indentpython.vim" ]; then
    cd $bundle_dir
    git clone git@github.com:vim-scripts/indentpython.vim.git
    echo "Indent Python installed"
fi

# A plugin to check the syntax.
if [ ! -d "$dir/vim/bundle/syntastic" ]; then
    cd $bundle_dir
    git clone git@github.com:vim-syntastic/syntastic.git
    echo "Syntastic installed"
fi

# A plugin to check thet the Python code is PEP-8 compliant.
if [ ! -d "$dir/vim/bundle/vim-flake8" ]; then
    cd $bundle_dir
    git clone git@github.com:nvie/vim-flake8.git
    "vim-flake8 installed"
fi

# A plugin that gives me a directory tree a la Atom or Sublime.
# First the tree system itself.
if [ ! -d "$dir/vim/bundle/nerdtree" ]; then
    cd $bundle_dir
    git clone git@github.com:scrooloose/nerdtree.git
    echo "Nerdtree installed"
fi
# Then a way to work with tabs.
if [ ! -d "$dir/vim/bundle/vim-nerdtree-tabs" ]; then
    cd $bundle_dir
    git clone git@github.com:jistr/vim-nerdtree-tabs.git
fi

# A plugin to manage the info line at the bottom of the vim screen.
# Plus a plugin to manage the themes used for that info line.
if [ ! -d "$dir/vim/bundle/vim-airline" ]; then
    cd $bundle_dir
    git clone git@github.com:vim-airline/vim-airline.git
    echo "vim-airline installed"
fi

if [ ! -d "$dir/vim/bundle/vim-airline-themes" ]; then
    cd $bundle_dir
    git clone git@github.com:vim-airline/vim-airline-themes.git
    echo "vim-airline-themes installed"
fi

if [ ! -d "$dir/vim/bundle/jupyter-vim" ]; then
    cd $bundle_dir
    git clone git@github.com:jupyter-vim/jupyter-vim.git
fi
echo "All Vim plugins are installed."

