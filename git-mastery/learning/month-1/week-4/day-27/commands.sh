#!/bin/bash

echo "=== Day 27: Reflog & Recovery ==="

cd ~
rm -rf reflog-practice 2>/dev/null
mkdir reflog-practice && cd reflog-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Make some commits ---"
echo "Line 1" >> README.md
git add . && git commit -m "Add line 1"

echo "Line 2" >> README.md
git add . && git commit -m "Add line 2"

echo "Line 3" >> README.md
git add . && git commit -m "Add line 3"

echo ""
echo "--- View reflog ---"
git reflog

echo ""
echo "--- Hard reset ---"
git reset --hard HEAD~1
echo "After reset:"
git log --oneline

echo ""
echo "--- Recover from reflog ---"
echo "Finding original HEAD..."
git reflog
git reset --hard HEAD@{1}

echo ""
echo "After recovery:"
git log --oneline

echo ""
echo "--- Simulate deleted branch ---"
git branch backup
git reflog | grep backup || echo "Branch exists but reflog shows operations"

echo ""
echo "=== Practice Complete ==="
