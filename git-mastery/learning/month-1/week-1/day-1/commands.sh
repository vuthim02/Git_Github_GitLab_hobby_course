#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════════╗
# ║                         DAY 1: COMMANDS REFERENCE                            ║
# ║                    What is Version Control?                                 ║
# ╚═══════════════════════════════════════════════════════════════════════════════╝

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 1: CHECKING GIT INSTALLATION
# ─────────────────────────────────────────────────────────────────────────────

# Check if Git is installed and show version
git --version

# Check where Git is installed (which executable)
which git

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 2: GETTING HELP
# ─────────────────────────────────────────────────────────────────────────────

# Open general Git help (shows list of common commands)
git help

# Get help for a specific command (opens man page)
git help init
git help commit
git help branch
git help merge

# Quick help (shows in terminal, no man page)
git init --help
git commit --help

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 3: CHECKING SYSTEM INFO (for configuration later)
# ─────────────────────────────────────────────────────────────────────────────

# Check your username
whoami

# Check your home directory
echo $HOME

# Check your default shell
echo $SHELL

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 4: PRACTICE COMMANDS (for tomorrow - advanced)
# ─────────────────────────────────────────────────────────────────────────────

# Check if you're in a Git repository (will show "fatal: not a git repository")
git status

# Create a test directory and initialize Git (for practice)
mkdir -p ~/git-practice
cd ~/git-practice
git init

# Verify .git directory was created
ls -la

# Check the contents of .git directory
ls -la .git/

# Clean up (remove test directory)
cd ~
rm -rf ~/git-practice

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 5: READING GIT DOCS ONLINE
# ─────────────────────────────────────────────────────────────────────────────

# These are URLs, not commands - visit them in your browser:
# https://git-scm.com/doc
# https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control
# https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F

# ─────────────────────────────────────────────────────────────────────────────
# EXPLANATION OF EACH COMMAND
# ─────────────────────────────────────────────────────────────────────────────

# git --version
#   PURPOSE: Check installed Git version
#   OUTPUT:  "git version 2.43.0" or similar
#   WHY:     Different versions have different features

# git help
#   PURPOSE: Open Git manual
#   OUTPUT:  Interactive list of common commands
#   WHY:     Reference when you forget commands

# git help <command>
#   PURPOSE: Get detailed help for specific command
#   OUTPUT:  Manual page for that command
#   WHY:     Learn all options for a command

# git status
#   PURPOSE: Check if current directory is a Git repository
#   OUTPUT:  "fatal: not a git repository" if not in a repo
#   WHY:     You'll use this A LOT in practice

# git init
#   PURPOSE: Initialize a new Git repository
#   OUTPUT:  Creates .git directory
#   WHY:     First command to start tracking with Git

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "  DAY 1 COMMANDS COMPLETE"
echo "  Next: Day 2 - Git Setup & Configuration"
echo "═══════════════════════════════════════════════════════════════════════════════"
