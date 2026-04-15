#!/bin/bash

# ==============================================================================
# Day 7: Week 1 Review & Practice - Commands
# ==============================================================================

echo "======================================"
echo "Git Mastery - Day 7 Commands"
echo "Week 1 Review & Practice"
echo "======================================"
echo ""

# ------------------------------------------------------------------------------
# SECTION 1: Week 1 Command Review
# ------------------------------------------------------------------------------

echo "=== SECTION 1: Week 1 Command Summary ==="
echo ""

echo "SETUP & CONFIGURATION"
echo "---------------------"
echo "git --version           # Check version"
echo "git config --list       # Show config"
echo "git config --global user.name \"Your Name\""
echo "git config --global user.email \"your@email.com\""
echo ""

echo "REPOSITORY CREATION"
echo "-------------------"
echo "git init                # Initialize repo"
echo "ls -la .git/           # Explore .git directory"
echo "git status             # Check status"
echo "git status -s         # Short format"
echo ""

echo "STAGING & COMMITTING"
echo "--------------------"
echo "git add file.txt       # Stage file"
echo "git add .             # Stage all"
echo "git commit -m \"msg\"   # Commit"
echo "git commit -am \"msg\"  # Add tracked + commit"
echo "git log --oneline      # View history"
echo ""

echo "COMPARING CHANGES"
echo "-----------------"
echo "git diff               # Unstaged changes"
echo "git diff --staged      # Staged changes"
echo "git diff HEAD          # vs HEAD"
echo "git diff --stat        # Summary"
echo ""

echo "VIEWING HISTORY"
echo "---------------"
echo "git log                # Full history"
echo "git log --oneline      # Compact"
echo "git log --graph        # ASCII graph"
echo "git show HEAD         # Latest commit"
echo "git blame file.txt    # Line history"
echo ""

echo "GIT INTERNALS"
echo "-------------"
echo "git cat-file -t hash  # Object type"
echo "git cat-file -p hash  # Object content"
echo "git hash-object file  # Calculate hash"
echo "git ls-tree hash      # List tree"
echo ""

# ------------------------------------------------------------------------------
# SECTION 2: Full Workflow Demo
# ------------------------------------------------------------------------------

echo "=== SECTION 2: Full Workflow Demo ==="
echo ""

# Create fresh repo
mkdir -p ~/week1-review-demo
cd ~/week1-review-demo
rm -rf .git
git init

# Configure if needed
git config user.name "Review User" 2>/dev/null || true
git config user.email "review@example.com" 2>/dev/null || true

echo "Created fresh repository for demo"
echo ""

# Step 1: Initial commit
echo "Step 1: Initial commit"
echo "# My Project" > README.md
git add README.md
git commit -m "Initial commit: Add README"
echo ""

# Step 2: Add files
echo "Step 2: Add project files"
echo "console.log('Hello');" > app.js
echo "body { margin: 0; }" > style.css
mkdir -p src
echo "// Main module" > src/main.js
git add .
git commit -m "Add project structure"
echo ""

# Step 3: Make changes
echo "Step 3: Make changes"
echo "console.log('World');" >> app.js
git commit -am "Enhance app.js"
echo ""

# Step 4: View history
echo "Step 4: View history"
git log --oneline --graph --all
echo ""

# Step 5: Show diff
echo "Step 5: Show current diff"
echo "// Added feature" >> style.css
git diff --stat
echo ""

# Step 6: Investigate internals
echo "Step 6: Investigate internals"
echo "Latest commit object:"
git cat-file -p HEAD
echo ""

echo "Root tree:"
git cat-file -p HEAD^{tree}
echo ""

# ------------------------------------------------------------------------------
# SECTION 3: Challenge Practice
# ------------------------------------------------------------------------------

echo "=== SECTION 3: Git Detective Challenge ==="
echo ""

# Setup bug scenario
mkdir -p ~/git-detective
cd ~/git-detective
rm -rf .git
git init
git config user.name "Detective" 2>/dev/null || true
git config user.email "detective@example.com" 2>/dev/null || true

echo "Step 1: Initial working code"
echo "function calculate(x, y) { return x + y; }" > math.js
git add math.js
git commit -m "Add math utility function"
echo ""

echo "Step 2: Someone claims to fix a bug"
echo "function calculate(x, y) { return x - y; }" > math.js
git commit -am "Fix bug: correct calculation"
echo ""

echo "Step 3: Investigate with git log"
git log --oneline
echo ""

echo "Step 4: Show the 'fix' commit"
git show HEAD
echo ""

echo "Step 5: Compare with previous"
git diff HEAD~1 HEAD
echo ""

echo "DETECTIVE REPORT:"
echo "The 'fix' actually BROKE the function!"
echo "It should ADD, not SUBTRACT!"
echo ""

# ------------------------------------------------------------------------------
# SECTION 4: Self-Quiz Answers
# ------------------------------------------------------------------------------

echo "=== SECTION 4: Self-Quiz Answers ==="
echo ""

echo "SECTION A - Answers:"
echo "1. c) Distributed"
echo "2. b) Creates a new .git directory"
echo "3. b) A holding area for changes before commit"
echo "4. c) Blob"
echo "5. b) Tree"
echo "6. b) File content"
echo "7. b) Current commit/branch"
echo "8. c) 3 (working, staging, repository)"
echo "9. b) Staging vs last commit"
echo "10. b) git log"
echo ""

echo "SECTION B - Answers:"
echo "1-c, 2-a, 3-e, 4-f, 5-d, 6-b, 7-h, 8-g, 9-i, 10-j"
echo ""

# ------------------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------------------

echo "======================================"
echo "Week 1 Review Complete!"
echo "======================================"
echo ""
echo "You've reviewed:"
echo "  ✓ All Week 1 commands"
echo "  ✓ Complete Git workflow"
echo "  ✓ Git internals"
echo "  ✓ History commands"
echo "  ✓ Self-quiz answers"
echo ""
echo "Week 1 Topics Mastered:"
echo "  ✓ Version Control Fundamentals"
echo "  ✓ Git Setup & Configuration"
echo "  ✓ Creating Repositories"
echo "  ✓ The Git Workflow (Staging & Committing)"
echo "  ✓ Git Internals (Objects)"
echo "  ✓ Viewing History & Differences"
echo ""
echo "Ready for Week 2: Branching Mastery!"
