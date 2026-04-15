#!/bin/bash

# Day 36: GitLab Overview - Commands

echo "GitLab CLI (glab) Commands"

# Install
# macOS: brew install glab
# Linux: sudo apt install glab

# Authenticate
glab auth login

# Create project
glab project create --name project-name --visibility public

# Clone
glab repo clone user/repo

# Push to GitLab (same as GitHub)
git remote add origin https://gitlab.com/user/repo.git
git push -u origin main