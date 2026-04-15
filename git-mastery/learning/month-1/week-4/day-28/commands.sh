#!/bin/bash

echo "=== Day 28: Month 1 Final Review ==="

cd ~
rm -rf month1-final-review 2>/dev/null
mkdir month1-final-review && cd month1-final-review
git init

echo "# Git Mastery - Month 1 Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Month 1 Topics Demonstrated ---"

echo ""
echo "=== Week 1: Git Basics ==="
echo "Initial commit created"

echo ""
echo "=== Week 2: Branching ==="
git branch feature-review
git switch -c feature-review
echo "Feature work" > feature.txt
git add . && git commit -m "Add feature"
git switch main
git merge feature-review --no-ff -m "Merge feature"
git branch -d feature-review

echo ""
echo "=== Week 3: Remote Collaboration ==="
echo "Remote: origin (simulated)"
git remote add origin https://github.com/user/repo.git
git remote -v

echo ""
echo "=== Week 4: Advanced Git ==="
git switch -c advanced-feature
echo "Advanced work" > advanced.txt
git add . && git commit -m "Add advanced feature"
git rebase main
git stash
git stash pop
git switch main
git cherry-pick advanced-feature~0 2>/dev/null || true

echo ""
echo "--- Final History ---"
git log --oneline --graph --all

echo ""
echo "--- Reflog (safety net) ---"
git reflog -5

echo ""
echo "=== MONTH 1 COMPLETE ==="
echo ""
echo "Topics mastered:"
echo "✓ Git basics"
echo "✓ Branching & merging"
echo "✓ Remote collaboration"
echo "✓ Rebasing"
echo "✓ Cherry-picking"
echo "✓ Stashing"
echo "✓ Reset & revert"
echo "✓ Recovery with reflog"
echo ""
echo "You're now a Git user!"
