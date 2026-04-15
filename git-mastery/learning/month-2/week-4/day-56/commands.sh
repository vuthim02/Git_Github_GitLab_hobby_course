#!/bin/bash

# Day 56: Final Assessment - Commands Reference

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Day 56: Final Assessment - Reference                   ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Commands by Category:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "BASIC GIT"
echo "----------------------------------------"
cat << 'EOF'
git init                    # Initialize repo
git clone <url>            # Clone repo
git add <file>            # Stage file
git commit -m "msg"       # Commit
git status                # Check status
git log --oneline        # View history
git diff                  # Show changes
EOF
echo ""

echo "BRANCHING"
echo "----------------------------------------"
cat << 'EOF'
git branch                # List branches
git branch <name>         # Create branch
git checkout <branch>     # Switch branch
git checkout -b <name>    # Create and switch
git merge <branch>        # Merge branch
git branch -d <name>      # Delete branch
EOF
echo ""

echo "REMOTE OPERATIONS"
echo "----------------------------------------"
cat << 'EOF'
git remote -v             # View remotes
git push                  # Push to remote
git pull                 # Pull from remote
git fetch                # Fetch changes
git clone <url>          # Clone repository
EOF
echo ""

echo "ADVANCED GIT"
echo "----------------------------------------"
cat << 'EOF'
git rebase                # Rebase branch
git cherry-pick <commit> # Pick specific commit
git stash                # Stash changes
git reset --soft HEAD~1  # Undo commit
git revert <commit>      # Revert commit
git reflog               # View reflog
git bisect               # Find buggy commit
EOF
echo ""

echo "GITHUB"
echo "----------------------------------------"
cat << 'EOF'
gh repo create <name>     # Create repo
gh pr create             # Create PR
gh pr list               # List PRs
gh pr merge <num>        # Merge PR
gh issue create          # Create issue
git push -u origin main  # First push
EOF
echo ""

echo "WORKFLOW COMMANDS"
echo "----------------------------------------"
cat << 'EOF'
git worktree add <path> <branch>  # Create worktree
git submodule add <url> <path>    # Add submodule
git tag v1.0.0                     # Create tag
git config --global alias.<name> "<cmd>"  # Create alias
EOF
