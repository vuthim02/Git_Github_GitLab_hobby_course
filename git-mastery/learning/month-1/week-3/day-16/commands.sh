#!/bin/bash

echo "=== Day 16: Cloning & Fetching ==="

# Note: This creates a local "remote" for demonstration
# In real use, you'd clone from GitHub/GitLab

cd ~
rm -rf remote-repo 2>/dev/null
mkdir remote-repo && cd remote-repo
git init --bare

cd ~
rm -rf clone-practice 2>/dev/null

echo ""
echo "--- Clone (simulated with local path) ---"
git clone remote-repo clone-practice
cd clone-practice

echo "# Project" > README.md
git add . && git commit -m "Initial commit"
git remote -v

echo ""
echo "--- Simulate remote changes (in bare repo) ---"
cd ../remote-repo
git config user.email "remote@example.com"
echo "Remote work" > remote-file.txt
git add . && git commit -m "Remote commit"
git log --oneline

echo ""
echo "--- Fetch updates ---"
cd ../clone-practice
git fetch origin

echo ""
echo "--- Remote tracking branches ---"
git branch -r

echo ""
echo "--- Compare local vs remote ---"
echo "Local main:"
git log --oneline main
echo ""
echo "Origin/main (remote-tracking):"
git log --oneline origin/main

echo ""
echo "=== Practice Complete ==="
