#!/bin/bash

echo "=== Day 17: Pulling & Merging ==="

cd ~
rm -rf pull-practice remote-pull 2>/dev/null

# Setup remote
mkdir remote-pull && cd remote-pull
git init --bare

# Clone
cd ..
git clone remote-pull local-pull
cd local-pull

echo "# Project" > README.md
git add . && git commit -m "Initial commit"
git push origin main

echo ""
echo "--- Make remote changes ---"
cd ../remote-pull
git config user.email "remote@example.com"
echo "Remote update" > remote.txt
git add . && git commit -m "Remote adds file"
git log --oneline

echo ""
echo "--- Pull changes ---"
cd ../local-pull
git pull origin main

echo ""
echo "--- See merged state ---"
ls -la
git log --oneline

echo ""
echo "--- Demonstrate rebase ---"
git log --oneline
echo "More local work" >> README.md
git add . && git commit -m "Local commit"

# Make remote changes
cd ../remote-pull
echo "Another remote" > another.txt
git add . && git commit -m "Another remote commit"
git log --oneline

echo ""
echo "--- Pull with rebase ---"
cd ../local-pull
git pull --rebase origin main

echo ""
echo "--- Final history (linear) ---"
git log --oneline --graph

echo ""
echo "=== Practice Complete ==="
