#!/bin/bash

echo "=== Day 22: Rebase Fundamentals ==="

cd ~
rm -rf rebase-practice 2>/dev/null
mkdir rebase-practice && cd rebase-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Create commits on main ---"
echo "Line 1" >> README.md
git add . && git commit -m "Add line 1"

echo ""
echo "--- Create feature branch ---"
git branch feature
git checkout feature
echo "Feature work" > feature.txt
git add . && git commit -m "Add feature"

echo "More feature" >> feature.txt
git add . && git commit -m "Update feature"

echo ""
echo "--- Before rebase ---"
git log --oneline --graph --all

echo ""
echo "--- Rebase feature onto main ---"
git rebase main

echo ""
echo "--- After rebase ---"
git log --oneline --graph --all

echo ""
echo "--- Verify branches ---"
git branch -v

echo ""
echo "=== Practice Complete ==="
echo "Notice: History is now linear"
echo "Commits D and E are replayed after C"
