#!/bin/bash

echo "=== Day 21: Week 3 Review - Challenges ==="

cd ~
rm -rf week3-review 2>/dev/null

echo ""
echo "--- Challenge 1: Complete Fork Workflow ---"
echo "Simulating full collaboration workflow"

# Simulated upstream
mkdir upstream && cd upstream
git init
echo "# Main Project" > README.md
git add . && git commit -m "Initial commit"
cd ..

# Clone (fork simulation)
git clone upstream week3-fork
cd week3-fork

echo ""
echo "--- Challenge 2: Add remotes ---"
git remote rename origin upstream
git remote add origin $(pwd)
git remote -v

echo ""
echo "--- Challenge 3: Feature branch workflow ---"
git switch -c feature-review-work
echo "New feature" > new-feature.txt
git add . && git commit -m "Add new feature"
git push -u origin feature-review-work 2>/dev/null || echo "(Push simulated)"

echo ""
echo "--- Challenge 4: Sync workflow ---"
# Simulate upstream changes
cd ../upstream
git config user.email "upstream@example.com"
echo "Upstream update" > upstream-update.txt
git add . && git commit -m "Add upstream update"

# Sync in fork
cd ../week3-fork
git fetch upstream
git merge upstream/main -m "Sync with upstream"

echo ""
echo "--- Challenge 5: Pull with rebase ---"
git switch feature-review-work
echo "More work" >> new-feature.txt
git add . && git commit -m "Update feature"

# Simulate upstream changes again
cd ../upstream
echo "Another update" > another.txt
git add . && git commit -m "Another upstream update"

cd ../week3-fork
git fetch upstream
git merge upstream/main -m "Sync again"

echo ""
echo "--- Final state ---"
git log --oneline --graph --all

echo ""
echo "=== Week 3 Review Complete ==="
echo "Week 3 covered:"
echo "1. Remote basics"
echo "2. Cloning and fetching"
echo "3. Pulling and merging"
echo "4. Pushing and authentication"
echo "5. GitHub Pull Requests"
echo "6. GitLab Merge Requests"
