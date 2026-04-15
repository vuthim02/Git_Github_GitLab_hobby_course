#!/bin/bash

echo "=== Day 15: Git Remote Basics ==="

cd ~
rm -rf remote-practice 2>/dev/null
mkdir remote-practice && cd remote-practice
git init

echo "# My Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Before adding remote ---"
git remote -v

echo ""
echo "--- Add remote ---"
git remote add origin https://github.com/example/repo.git
git remote add upstream https://github.com/original/repo.git

echo ""
echo "--- After adding remote ---"
git remote -v

echo ""
echo "--- Show remote details ---"
git remote show origin

echo ""
echo "--- Rename remote ---"
git remote rename origin primary
git remote -v

echo ""
echo "--- Change URL ---"
git remote set-url primary https://github.com/newuser/newrepo.git
git remote -v

echo ""
echo "--- Remove remote ---"
git remote remove upstream
git remote -v

echo ""
echo "=== Practice Complete ==="
