#!/bin/bash

echo "=== Day 18: Pushing & Authentication ==="

cd ~
rm -rf push-practice remote-push 2>/dev/null

# Setup remote
mkdir remote-push && cd remote-push
git init --bare

# Clone
cd ..
git clone remote-push local-push
cd local-push

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- First push (set upstream) ---"
git push -u origin main

echo ""
echo "--- Make changes and push ---"
echo "New feature" > feature.txt
git add . && git commit -m "Add feature"
git push

echo ""
echo "--- Create branch and push ---"
git switch -c new-feature
echo "More work" > new-feature.txt
git add . && git commit -m "New feature work"
git push -u origin new-feature

echo ""
echo "--- Delete remote branch ---"
git switch main
git push origin --delete new-feature

echo ""
echo "--- Simulate rejected push ---"
# Make changes locally
echo "Local change" > local.txt
git add . && git commit -m "Local commit"

# Make changes in remote
cd ../remote-push
git config user.email "remote@example.com"
echo "Remote change" > remote.txt
git add . && git commit -m "Remote commit"

# Try push (will be rejected)
cd ../local-push
git push 2>/dev/null || echo "Push rejected - need to pull first"

echo ""
echo "--- Handle rejection ---"
git pull --rebase origin main
git push

echo ""
echo "=== Practice Complete ==="
