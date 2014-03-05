# Dotfiles for the OS X and Linux systems.

The code in this repository organizes my dotfiles. The repository should be cloned into the home directory so that the path is ~/dotfiles/. The `makesymlinks.sh` setup script creates symlinks from the home directory to the files in ~/dotfiles/. 

The setup script is smart enough to back up your existing dotfiles into a ~/dotfiles_old/ directory if you already have any dotfiles of the same name as the dotfile symlinks being created in your home directory.

The install script will:
1. Back up any existing dotfiles in the home directory to ~/dotfiles_old/
2. Create symlinks to the dotfiles in ~/dotfiles/ in the home directory

I have included some simple if statements to handle two different operating systems: OS X and Linux. Since PATHS and tools can differ between these to operating systems, having separate sections was necessary. Right now, these dotfiles can be installed and run for either system essentially seamlessly.

# Installation

```
git clone git://github.com/soto97/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```


This dotfiles setup is based on [Michael Smalley's dotfiles setup](https://github.com/michaeljsmalley/dotfiles), which he described at his [blog](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/).

