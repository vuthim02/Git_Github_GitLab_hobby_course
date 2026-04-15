#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════════╗
# ║                         DAY 2: COMMANDS REFERENCE                            ║
# ║                      Git Setup & Configuration                              ║
# ╚═══════════════════════════════════════════════════════════════════════════════╝

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 1: CHECKING CURRENT CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# List all configuration
git config --list

# List global (user) configuration
git config --global --list

# Check specific settings
git config --global user.name
git config --global user.email
git config --global core.editor

# Show where a setting is defined (file + line)
git config --show-origin user.name
git config --show-origin core.editor

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 2: SETTING YOUR IDENTITY
# ─────────────────────────────────────────────────────────────────────────────

# Set your name (required before committing)
git config --global user.name "Your Name"

# Set your email (required before committing)
git config --global user.email "your.email@example.com"

# Verify
echo "Configured name: $(git config --global user.name)"
echo "Configured email: $(git config --global user.email)"

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 3: EDITOR CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# Option A: VS Code (recommended)
git config --global core.editor "code --wait"

# Option B: Vim
git config --global core.editor vim

# Option C: Nano
git config --global core.editor nano

# Option D: Sublime
git config --global core.editor "subl -n -w"

# Option E: Atom
git config --global core.editor "atom --wait"

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 4: LINE ENDING CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# For Windows (converts LF to CRLF on checkout)
git config --global core.autocrlf true

# For Linux/macOS (converts CRLF to LF on commit)
git config --global core.autocrlf input

# To disable (not recommended for cross-platform projects)
git config --global core.autocrlf false

# Check current setting
git config --global core.autocrlf

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 5: CREATING ALIASES
# ─────────────────────────────────────────────────────────────────────────────

# Basic aliases
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"
git config --global alias.unstage "reset HEAD --"

# Advanced aliases
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.ds "diff --staged"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "log --graph --oneline --all"

# List all aliases
git config --get-regexp alias

# Remove an alias
git config --global --unset alias.st

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 6: EDITING CONFIG FILE MANUALLY
# ─────────────────────────────────────────────────────────────────────────────

# View the global config file
cat ~/.gitconfig

# Or use your editor
code ~/.gitconfig    # VS Code
nano ~/.gitconfig    # Nano
vim ~/.gitconfig     # Vim

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 7: PROJECT-SPECIFIC (LOCAL) CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# Go to your project directory
cd ~/path/to/your/project

# Set project-specific settings (overrides global)
git config --local user.name "Project Author"
git config --local user.email "project@company.com"

# These settings are stored in .git/config (per-repo)
cat .git/config

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 8: UNSETTING CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# Remove a specific setting
git config --global --unset user.name
git config --global --unset user.email

# Remove all aliases
git config --global --remove-section alias

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 9: TESTING CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────

# Create a test repository
mkdir -p ~/git-config-test
cd ~/git-config-test
git init

# Create a file
echo "test" > test.txt

# Try to commit (tests if identity is set)
git add test.txt
git commit -m "Test commit"

# View the commit
git log -1

# Clean up
cd ~
rm -rf ~/git-config-test

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 10: CONFIGURATION FOR DIFFERENT PLATFORMS
# ─────────────────────────────────────────────────────────────────────────────

# WINDOWS ONLY - Enable credential caching
git config --global credential.helper winstore

# MAC ONLY - Enable credential caching
git config --global credential.helper osxkeychain

# LINUX ONLY - Enable credential caching
git config --global credential.helper store

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 11: USEFUL GLOBAL SETTINGS
# ─────────────────────────────────────────────────────────────────────────────

# Default branch name
git config --global init.defaultBranch main

# Colorize output
git config --global color.ui auto

# Set default push behavior
git config --global push.default simple

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 12: TROUBLESHOOTING
# ─────────────────────────────────────────────────────────────────────────────

# Show all configuration with file origins
git config --list --show-origin

# Check if you're in a repository
git rev-parse --git-dir

# Check if git is initialized
git status

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "  DAY 2 COMMANDS COMPLETE"
echo "  Next: Day 3 - Creating Your First Repository"
echo "═══════════════════════════════════════════════════════════════════════════════"
