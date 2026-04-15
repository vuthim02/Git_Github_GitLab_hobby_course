#!/bin/bash

# Day 37: GitLab Merge Requests - Commands

echo "GitLab MR CLI Commands"

# Create MR
glab mr create --title "Add feature" --description "Description" --source-branch feature --target-branch main

# List MRs
glab mr list

# View MR
glab mr view 1

# Approve MR
glab mr approve 1

# Merge MR
glab mr merge 1