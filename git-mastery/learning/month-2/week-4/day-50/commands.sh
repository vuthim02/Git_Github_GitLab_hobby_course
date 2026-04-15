#!/bin/bash

# Day 50: Debugging Commands

# Status
git status

# Diff
git diff
git diff --staged
git diff HEAD~1 HEAD

# Log filters
git log --oneline
git log --author="name"
git log --grep="keyword"
git log --since="2024-01-01"

# Blame
git blame file.txt

# Reflog
git reflog