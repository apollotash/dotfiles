#!/bin/bash

#This script designed to update github repostories when they are updated on computer.

#Location where this .sh file exist.
mainloc=~/GitRepos/dotfiles

cd ~

cp -r .bash_aliases .bashrc .bash_profile .git/ .gitconfig .gtkrc-2.0 .icons/ .vimrc .xprofile $mainloc

cd ~/.config

cp -r alacritty/ bspwm/ Code/ fish/ ktouch2rc  nitrogen/ nvim/ polybar/ rofi/ sxhkd/ $mainloc

cd $mainloc


git status
git add .
git commit -m "Last update"


git remote add origin git@github.com:apollotash/dotfiles.git
git push -u origin master
