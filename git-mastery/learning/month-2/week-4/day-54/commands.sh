#!/bin/bash

# Day 54: Custom Aliases

# Git config aliases
git config --global alias.st status
git config --global alias.co checkout  
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.undo "reset --soft HEAD~1"

# Shell aliases (in ~/.bashrc)
# alias gs="git status"
# alias ga="git add"
# alias gc="git commit"
# alias gp="git push"