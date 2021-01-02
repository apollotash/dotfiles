#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
#Colors for Ps1
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
PS1="\033[01;34m┌──[\D{%H:%M:%S}] \033[01;31m[\u@\h] \w \033[03;34m\n└──[\$] → \[\033[00m\]"

#For a random quotaion
[[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune)\e[00m"

