#!/bin/bash

echo "=== Day 23: Interactive Rebase ==="

cd ~
rm -rf interactive-rebase 2>/dev/null
mkdir interactive-rebase && cd interactive-rebase
git init

echo "# Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Create commits to practice with ---"
echo "Change 1" > file1.txt
git add . && git commit -m "Add file1"

echo "Change 2" > file2.txt
git add . && git commit -m "Add file2"

echo "Change 3" > file3.txt
git add . && git commit -m "Add file3"

echo ""
echo "--- Current history ---"
git log --oneline

echo ""
echo "--- Show what interactive rebase looks like ---"
echo "Command to run:"
echo "git rebase -i HEAD~3"
echo ""
echo "Would show:"
cat << 'EOF'
pick abc123 Add file1
pick def456 Add file2
pick ghi789 Add file3

# Commands:
# p, pick = use commit
# r, reword = change message
# s, squash = combine with previous
# f, fixup = squash, discard message
# d, drop = remove commit
EOF

echo ""
echo "--- Simulate squash (showing result) ---"
echo "Squashing file2 and file3 into one commit"
git rebase -i HEAD~3 --exec "true" 2>/dev/null || echo "(Requires interactive editor)"

echo ""
echo "=== Practice Complete ==="
echo "To practice interactive rebase:"
echo "1. Run: git rebase -i HEAD~3"
echo "2. Change 'pick' to 'squash' as needed"
echo "3. Save and close editor"
echo "4. Git combines the commits"
