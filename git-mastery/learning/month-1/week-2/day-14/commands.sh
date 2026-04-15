#!/bin/bash

echo "=== Day 14: Week 2 Review - Challenge ==="

cd ~
rm -rf week2-review 2>/dev/null
mkdir week2-review && cd week2-review
git init

echo "# Git Mastery Course" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Challenge 1: GitHub Flow ---"
git switch -c feature-nav
echo "<nav>Navbar</nav>" > navbar.html
git add . && git commit -m "Add navbar"
git switch main
git merge feature-nav --no-ff -m "Merge navbar feature"

git switch -c feature-sidebar
echo "<aside>Sidebar</aside>" > sidebar.html
git add . && git commit -m "Add sidebar"
git switch main
git merge feature-sidebar --no-ff -m "Merge sidebar feature"

echo ""
echo "--- Challenge 2: Conflict Resolution ---"
git switch -c feature-footer
echo "Footer v1" > footer.html
git add . && git commit -m "Footer v1"
git switch main

echo "Footer v2" > footer.html
git add . && git commit -m "Footer v2"
git merge feature-footer || true

echo ""
echo "--- Simulated resolution ---"
echo "Footer combined" > footer.html
git add footer.html
git commit -m "Resolve conflict: combine footers"

echo ""
echo "--- Final graph ---"
git log --oneline --graph --all

echo ""
echo "=== Week 2 Review Complete ==="
echo "You should now understand:"
echo "1. Creating and switching branches"
echo "2. Understanding HEAD"
echo "3. Merging branches"
echo "4. Resolving conflicts"
echo "5. Branching workflows"
