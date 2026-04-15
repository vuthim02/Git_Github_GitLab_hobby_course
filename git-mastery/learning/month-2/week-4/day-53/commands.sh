#!/bin/bash

# Day 53: Worktrees

# Create worktree
git worktree add ../feature-branch feature

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../feature-branch

# Prune
git worktree prune