#!/bin/bash

echo "=== Day 25: Stashing Changes ==="

cd ~
rm -rf stash-practice 2>/dev/null
mkdir stash-practice && cd stash-practice
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Make uncommitted changes ---"
echo "Change 1" >> README.md
echo "New file" > newfile.txt

echo "Status before stash:"
git status

echo ""
echo "--- Stash changes ---"
git stash push -m "My work in progress"

echo ""
echo "Status after stash:"
git status
git stash list

echo ""
echo "--- Restore changes ---"
git stash pop

echo ""
echo "Status after pop:"
git status

echo ""
echo "--- Multiple stashes demo ---"
echo "More changes" >> README.md
git stash push -m "Stash 1"

echo "Even more" >> README.md
git stash push -m "Stash 2"

echo ""
echo "Stash list:"
git stash list

echo ""
echo "Apply most recent:"
git stash pop
git stash list

echo ""
echo "=== Practice Complete ==="
