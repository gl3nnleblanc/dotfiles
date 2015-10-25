#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias start-torrenting='sudo systemctl enable pia@Sweden && sudo systemctl start pia@Sweden.service'
alias stop-torrenting='sudo systemctl stop pia@Sweden.service && sudo systemctl disable pia@Sweden'
alias tekkit='java -jar /home/glenn/Downloads/TechnicLauncher.jar'
PS1='\[\e[0;32m\]\W\[\e[m  \e[0;31m»\e[m '
source /usr/share/doc/pkgfile/command-not-found.bash
