#!/bin/bash

echo "=== Day 19: GitHub Setup & Pull Requests ==="

cd ~
rm -rf github-workflow 2>/dev/null

echo ""
echo "--- Step 1: Fork workflow simulation ---"
echo "In real life: Click 'Fork' on GitHub"
echo "For simulation, we create local repos"

# Original repo (upstream)
mkdir upstream-repo && cd upstream-repo
git init
echo "# Original Project" > README.md
git add . && git commit -m "Initial commit"
cd ..

# Fork (clone of upstream)
git clone upstream-repo fork-repo 2>/dev/null || git clone upstream-repo fork-repo
cd fork-repo

# Add origin (in real life, this would be the fork URL)
git remote rename origin upstream 2>/dev/null || true

echo ""
echo "--- Step 2: Add origin remote ---"
git remote add origin $(pwd)
git remote -v

echo ""
echo "--- Step 3: Create feature branch ---"
git switch -c feature-contribution
echo "My contribution" > contribution.txt
git add . && git commit -m "Add contribution"
git push -u origin feature-contribution 2>/dev/null || echo "(Push simulated)"

echo ""
echo "--- Step 4: Create PR workflow ---"
echo "In real GitHub:"
echo "1. Go to your fork on GitHub"
echo "2. Click 'New Pull Request'"
echo "3. Select feature-contribution -> main"
echo "4. Write description"
echo "5. Submit PR"

echo ""
echo "--- Step 5: Simulate upstream merge ---"
cd ../upstream-repo
git remote add contributor ../fork-repo 2>/dev/null || true
git fetch contributor
git merge contributor/feature-contribution -m "Merge PR"
git log --oneline --graph --all

echo ""
echo "=== Practice Complete ==="
echo "Real GitHub workflow:"
echo "1. Fork on GitHub"
echo "2. Clone your fork"
echo "3. Add upstream remote"
echo "4. Create feature branch"
echo "5. Push to your fork"
echo "6. Create PR on GitHub"
