#
# ~/.bashrc
#

# If not running interactively, don't do anything
export PATH=$PATH:~/.bin
export EDITOR=vim
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by Anaconda3 installer
export PATH="/home/konig/anaconda3/bin:$PATH"
