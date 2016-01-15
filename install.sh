#!/bin/bash

ln -s $(readlink -f .)/.bashrc       ~/.bashrc
ln -s $(readlink -f .)/.bash_profile ~/.bash_profile
ln -s $(readlink -f .)/.gitconfig    ~/.gitconfig
ln -s $(readlink -f .)/.tmux.conf    ~/.tmux.conf
ln -s $(readlink -f .)/.tmux         ~/.tmux

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# vim +BundleInstall +qall
