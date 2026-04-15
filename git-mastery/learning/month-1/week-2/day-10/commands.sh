#!/bin/bash

echo "=== Day 10: Understanding HEAD ==="

cd ~
rm -rf head-practice 2>/dev/null
mkdir head-practice && cd head-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"
FIRST=$(git rev-parse HEAD)

echo "Line 2" >> README.md
git add . && git commit -m "Add line 2"
SECOND=$(git rev-parse HEAD)

echo "Line 3" >> README.md
git add . && git commit -m "Add line 3"

echo ""
echo "--- Normal state: Check HEAD ---"
echo "HEAD file:"
cat .git/HEAD
echo ""
echo "Current branch: $(git branch --show-current)"

echo ""
echo "--- Inspect HEAD ---"
echo "Rev-parse HEAD: $(git rev-parse HEAD)"
echo "HEAD~1: $(git rev-parse HEAD~1)"
echo "HEAD~2: $(git rev-parse HEAD~2)"

echo ""
echo "--- Enter detached HEAD state ---"
git checkout HEAD~1
echo "HEAD file now:"
cat .git/HEAD
echo ""
echo "Note: No 'ref:' - we're in detached HEAD"

echo ""
echo "--- Make commits in detached state ---"
echo "detached work" > detached.txt
git add . && git commit -m "Work in detached state"

echo ""
echo "--- Save with a branch ---"
git switch -c saved-branch
echo "Back to normal. Saved branch: $(git branch --show-current)"

echo ""
echo "--- Return to main ---"
git switch main

echo ""
echo "=== Practice Complete ==="
