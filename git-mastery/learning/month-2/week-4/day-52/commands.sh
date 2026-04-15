#!/bin/bash

# Day 52: Submodules & Subtrees

# Add submodule
git submodule add https://github.com/user/lib.git libs/lib

# Update submodule
git submodule update --init --recursive

# Add subtree  
git subtree add --prefix=lib https://github.com/user/lib.git main --squash

# Pull subtree updates
git subtree pull --prefix=lib https://github.com/user/lib.git main --squash