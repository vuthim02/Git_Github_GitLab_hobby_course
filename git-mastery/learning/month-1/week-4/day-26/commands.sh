#!/bin/bash

echo "=== Day 26: Reset vs Revert ==="

cd ~
rm -rf reset-revert-practice 2>/dev/null
mkdir reset-revert-practice && cd reset-revert-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Soft Reset Demo ---"
echo "Line 1" >> README.md
git add . && git commit -m "Add line 1"
echo "Before soft reset:"
git log --oneline -2

git reset --soft HEAD~1
echo "After soft reset (staged):"
git status
git log --oneline

echo ""
echo "--- Mixed Reset Demo ---"
git add . && git commit -m "Add line 1"
echo "Before mixed reset:"
git log --oneline -2

git reset HEAD~1
echo "After mixed reset (unstaged):"
git status

echo ""
echo "--- Hard Reset Demo ---"
git add . && git commit -m "Add line 1"
echo "Before hard reset:"
git log --oneline -2

git reset --hard HEAD~1
echo "After hard reset:"
git status
git log --oneline

echo ""
echo "--- Revert Demo ---"
echo "Line to revert" >> README.md
git add . && git commit -m "Add line to revert"
git log --oneline -2

git revert HEAD
echo "After revert:"
git log --oneline -2

echo ""
echo "=== Practice Complete ==="
