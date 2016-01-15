#!/bin/bash

ln -s .bashrc       ~/.bashrc
ln -s .bash_profile ~/.bash_profile
ln -s .gitconfig    ~/.gitconfig
ln -s .tmux.conf    ~/.tmux.conf
ln -s .tmux         ~/.tmux

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# vim +BundleInstall +qall