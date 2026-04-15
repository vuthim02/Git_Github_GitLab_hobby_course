#!/bin/bash

# Day 34: Protected Branches - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Day 34: Protected Branches - Commands                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: Setting Up Branch Protection
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: Setting Up Branch Protection"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Branch Protection via Web"
echo "----------------------------------------"
cat << 'EOF'
# Web Interface:
# 1. Repository → Settings → Branches
# 2. Add branch protection rule
# 3. Configure:

# Required Settings:
- Branch name pattern: main
- Require pull request reviews before merging
- Require status checks to pass
- Include administrators
EOF
echo ""

echo "Default Branch Settings"
echo "----------------------------------------"
cat << 'EOF'
# Repository → Settings → General
# Default branch section
# Change default branch name
# Even create new default from existing
EOF
echo ""

# ============================================
# SECTION 2: CODEOWNERS
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: CODEOWNERS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create CODEOWNERS file"
echo "----------------------------------------"
cat << 'EOF'
mkdir -p .github

cat > .github/CODEOWNERS << 'EOF'
# Default owner for all files
* @owner

# Frontend code
/src/frontend/ @frontend-team
/src/components/ @frontend-team

# Backend code
/src/backend/ @backend-team
/src/api/ @backend-team

# Infrastructure
/.github/workflows/ @devops-team
/infrastructure/ @devops-team

# Documentation
/docs/ @docs-team
*.md @technical-writer
EOF
EOF
echo ""

echo "CODEOWNERS syntax"
echo "----------------------------------------"
cat << 'EOF'
# Comments
# * @username             # Everything
# folder/ @username     # Folder
# *.js @username       # Extension
# @org/team           # Organization team
# @org/team-name      # Team reference
EOF
echo ""

echo "Push CODEOWNERS"
echo "----------------------------------------"
cat << 'EOF'
git add .github/CODEOWNERS
git commit -m "Add CODEOWNERS file"
git push origin main

# Note: Will need PR due to protection!
EOF
echo ""

# ============================================
# SECTION 3: Working with Protection
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Working with Protected Branches"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create branch"
echo "----------------------------------------"
cat << 'EOF'
git checkout -b feature/my-feature
echo "New feature" > feature.txt
git add . && git commit -m "Add feature"
EOF
echo ""

echo "Push branch"
echo "----------------------------------------"
cat << 'EOF'
git push -u origin feature/my-feature
EOF
echo ""

echo "Create PR via CLI"
echo "----------------------------------------"
cat << 'EOF'
gh pr create --title "Add my feature" --body "Description"
# Opens in browser for review workflow
EOF
echo ""

echo "View PR status"
echo "----------------------------------------"
cat << 'EOF'
gh pr list
gh pr view 1
EOF
echo ""

echo "Approve PR"
echo "----------------------------------------"
cat << 'EOF'
gh pr review 1 --approve
EOF
echo ""

echo "Merge PR"
echo "----------------------------------------"
cat << 'EOF'
gh pr merge 1
# Or: gh pr merge --squash 1
# Or: gh pr merge --rebase 1
EOF
echo ""

# ============================================
# SECTION 4: Status Checks
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: Status Checks"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Required Status Checks"
echo "----------------------------------------"
cat << 'EOF'
# CI workflow must check status:
# name: CI Pipeline
# runs on: push, pull_request

# Branch protection requires:
# - All status checks must pass
# - Branch must be up-to-date
EOF
echo ""

echo "Test Status Check"
echo "----------------------------------------"
cat << 'EOF'
# Create PR → Checks tab shows status
# All green: Ready to merge
# Any red: Blocked
EOF
echo ""

# ============================================
# SECTION 5: Troubleshooting
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Troubleshooting"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Common Issues"
echo "----------------------------------------"
cat << 'EOF'
# "X reviews required"
# → Get approval from required reviewer

# "Status check failed"
# → Check Actions tab, fix failing test

# "Outdated branch"
# → Update branch with main: git merge main

# "Conversation unresolved"
# → Resolve all comments in PR
EOF
echo ""

echo "Force Push (bypass - be careful!)"
echo "----------------------------------------"
cat << 'EOF'
# Force push is blocked with protection!
# Only way: Disable protection temporarily
EOF
echo ""

# ============================================
# SECTION 6: Complete Workflow
# ============================================
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║            COMPLETE PR WORKFLOW WITH PROTECTION                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

cat << 'EOF'
# 1. Update local main
git checkout main
git pull origin main

# 2. Create feature branch
git checkout -b feature/my-feature

# 3. Make changes
echo "Feature code" > feature.txt
git add . && git commit -m "Add feature"

# 4. Push branch
git push -u origin feature/my-feature

# 5. Create PR
gh pr create --title "Add feature" --body "Description here"

# 6. Get review
# Team member reviews and approves

# 7. Tests must pass (status checks)

# 8. Merge
gh pr merge --squash

# 9. Update local main
git checkout main && git pull
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                            ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"