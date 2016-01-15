#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

ln -s $SCRIPTPATH/.bashrc       ~/.bashrc
ln -s $SCRIPTPATH/.bash_profile ~/.bash_profile
ln -s $SCRIPTPATH/.gitconfig    ~/.gitconfig
ln -s $SCRIPTPATH/.tmux.conf    ~/.tmux.conf
ln -s $SCRIPTPATH/.tmux         ~/.tmux

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# vim +BundleInstall +qall
