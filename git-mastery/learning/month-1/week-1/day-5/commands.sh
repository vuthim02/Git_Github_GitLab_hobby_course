#!/bin/bash

# ==============================================================================
# Day 5: Understanding Git Internals - Practice Commands
# ==============================================================================

echo "======================================"
echo "Git Mastery - Day 5 Commands"
echo "Understanding Git Internals"
echo "======================================"
echo ""

# ------------------------------------------------------------------------------
# SECTION 1: Setup
# ------------------------------------------------------------------------------

echo "=== SECTION 1: Setup Repository ==="
echo ""

mkdir -p ~/git-internals-practice
cd ~/git-internals-practice
git init

# Create some files and commits
echo "# My Project" > README.md
echo "console.log('Hello');" > app.js
git add .
git commit -m "Initial commit"
echo ""

echo "Repository created with commits."
git log --oneline
echo ""

# ------------------------------------------------------------------------------
# SECTION 2: Explore .git/objects
# ------------------------------------------------------------------------------

echo "=== SECTION 2: Explore Objects Directory ==="
echo ""

echo "List all objects in .git/objects:"
find .git/objects -type f
echo ""

echo "This shows:"
echo "  - Each object is stored as <first 2 chars>/<remaining 38 chars>"
echo "  - Your blobs, trees, and commits are stored here"
echo ""

# ------------------------------------------------------------------------------
# SECTION 3: Examining a Commit
# ------------------------------------------------------------------------------

echo "=== SECTION 3: Examine a Commit ==="
echo ""

# Get the commit hash
COMMIT_HASH=$(git rev-parse HEAD)
echo "Latest commit hash: $COMMIT_HASH"
echo ""

echo "View commit object:"
git cat-file -p HEAD
echo ""

echo "View commit type:"
git cat-file -t HEAD
echo ""

# ------------------------------------------------------------------------------
# SECTION 4: Examining the Tree
# ------------------------------------------------------------------------------

echo "=== SECTION 4: Examine the Tree ==="
echo ""

echo "View root tree (the directory structure):"
git cat-file -p HEAD^{tree}
echo ""

echo "Each line shows:"
echo "  <mode> <type> <hash> <filename>"
echo ""

# Another way
echo "Using git ls-tree:"
git ls-tree -r HEAD
echo ""

# ------------------------------------------------------------------------------
# SECTION 5: Examining Blobs
# ------------------------------------------------------------------------------

echo "=== SECTION 5: Examine Blobs ==="
echo ""

# Get blob hash from tree
echo "Extract blob hash from README:"
TREE=$(git cat-file -p HEAD^{tree})
README_HASH=$(echo "$TREE" | grep README | awk '{print $3}')
echo "README.md blob hash: $README_HASH"
echo ""

echo "View blob content:"
git cat-file -p $README_HASH
echo ""

echo "Check blob type:"
git cat-file -t $README_HASH
echo ""

# ------------------------------------------------------------------------------
# SECTION 6: Hash Object
# ------------------------------------------------------------------------------

echo "=== SECTION 6: Hash Object Commands ==="
echo ""

# Calculate hash without storing
echo "Calculate hash of string:"
echo "Hello World" | git hash-object --stdin
echo ""

echo "Calculate hash of file:"
git hash-object README.md
echo ""

# Calculate hash and store
echo "Store blob and get hash:"
git hash-object -w app.js
echo ""

# Show all objects now
echo "Objects now in database:"
find .git/objects -type f | head -20
echo ""

# ------------------------------------------------------------------------------
# SECTION 7: Content Addressing Demo
# ------------------------------------------------------------------------------

echo "=== SECTION 7: Content Addressing Demo ==="
echo ""

echo "Same content = Same hash:"
echo "testing" | git hash-object --stdin
echo "testing" | git hash-object --stdin
echo ""

echo "Different content = Different hash:"
echo "testing" | git hash-object --stdin
echo "Testing" | git hash-object --stdin
echo ""

echo "This is content-addressable storage!"
echo ""

# ------------------------------------------------------------------------------
# SECTION 8: Tracing History
# ------------------------------------------------------------------------------

echo "=== SECTION 8: Trace History Through Objects ==="
echo ""

# Add another commit
echo "New feature" >> app.js
git add app.js
git commit -m "Add new feature to app"
echo ""

echo "View new commit:"
git cat-file -p HEAD
echo ""

echo "Notice parent reference points to previous commit."
echo ""

# View parent
echo "View parent commit:"
git cat-file -p HEAD^1
echo ""

# ------------------------------------------------------------------------------
# SECTION 9: Comparing Types
# ------------------------------------------------------------------------------

echo "=== SECTION 9: Object Types Comparison ==="
echo ""

echo "Commit type:"
git cat-file -t HEAD
echo ""

echo "Tree type:"
git cat-file -t HEAD^{tree}
echo ""

echo "Blob type:"
git cat-file -t $README_HASH
echo ""

# ------------------------------------------------------------------------------
# SECTION 10: Using Rev-Parse
# ------------------------------------------------------------------------------

echo "=== SECTION 10: Rev-Parse Commands ==="
echo ""

echo "Current branch:"
git rev-parse --symbolic-full-name HEAD
echo ""

echo "Commit hash:"
git rev-parse HEAD
echo ""

echo "Tree hash:"
git rev-parse HEAD^{tree}
echo ""

echo "Parent commit:"
git rev-parse HEAD^
echo ""

# ------------------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------------------

echo "======================================"
echo "Practice Complete!"
echo "======================================"
echo ""
echo "You've learned:"
echo "  ✓ Git stores everything as objects"
echo "  ✓ Four object types: blob, tree, commit, tag"
echo "  ✓ SHA-1 hashes identify content"
echo "  ✓ git cat-file -t/-p for inspection"
echo "  ✓ git hash-object for creating blobs"
echo "  ✓ Content-addressable storage concept"
echo ""
echo "Key concepts:"
echo "  - Blobs store file CONTENT only"
echo "  - Trees store DIRECTORY structure"
echo "  - Commits store SNAPSHOTS"
echo "  - Tags store ANNOTATIONS"
echo ""
echo "Next: Day 6 - Viewing History & Differences"
