#!/bin/bash

echo "=== Day 13: Branching Workflows ==="

# --- GitHub Flow ---
cd ~
rm -rf workflow-practice 2>/dev/null
mkdir workflow-practice && cd workflow-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- GitHub Flow: Feature Branch ---"
git switch -c feature-login
echo "Login form" > login.html
git add . && git commit -m "Add login form"
git switch main
git merge feature-login --no-ff -m "Merge feature-login"

echo ""
echo "--- GitHub Flow: Another feature ---"
git switch -c feature-dashboard
echo "Dashboard" > dashboard.html
git add . && git commit -m "Add dashboard"
git switch main
git merge feature-dashboard --no-ff -m "Merge feature-dashboard"

echo ""
echo "--- GitFlow Structure ---"
cd ~
rm -rf gitflow-practice 2>/dev/null
mkdir gitflow-practice && cd gitflow-practice
git init

echo "Initial" > README.md
git add . && git commit -m "Initial commit"

git checkout -b develop
echo "Dev work" > develop.txt
git add . && git commit -m "Develop work"

git checkout main
git checkout -b release/v1.0
echo "Release prep" > release.txt
git add . && git commit -m "Release prep"
git checkout main
git merge release/v1.0 -m "Release v1.0"
git checkout develop
git merge release/v1.0 -m "Sync develop"

echo ""
echo "--- Final GitFlow graph ---"
git log --oneline --graph --all

echo ""
echo "=== Practice Complete ==="
