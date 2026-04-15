#!/bin/bash

# Day 43: Git Flow - Commands

# Install git flow
brew install git-flow

# Initialize
git flow init

# Feature work
git flow feature start my-feature
# ... make changes ...
git flow feature finish my-feature

# Release work
git flow release start 1.0
# ... release fixes ...
git flow release finish 1.0

# Hotfix
git flow hotfix start fix-bug
# ... fix bug ...
git flow hotfix finish fix-bug