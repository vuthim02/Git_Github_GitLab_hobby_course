#!/bin/bash

# Day 49: Week 7 Review - Commands Reference

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Week 7 Review - Workflows Reference                   ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Git Flow Commands:"
echo "----------------------------------------"
cat << 'EOF'
# Create feature branch
git checkout develop
git checkout -b feature/my-feature

# Finish feature
git checkout develop
git merge --no-ff feature/my-feature
git branch -d feature/my-feature

# Create release branch
git checkout develop
git checkout -b release/v1.0.0

# Finish release
git checkout main
git merge --no-ff release/v1.0.0
git tag v1.0.0
git checkout develop
git merge --no-ff release/v1.0.0
git branch -d release/v1.0.0

# Hotfix
git checkout main
git checkout -b hotfix/urgent-fix
# fix code
git checkout main
git merge --hotfix/urgent-fix
git tag v1.0.1
git checkout develop
git merge hotfix/urgent-fix
EOF
echo ""

echo "GitHub Flow Commands:"
echo "----------------------------------------"
cat << 'EOF'
# Create feature
git checkout -b feature/my-feature
# make changes
git push -u origin feature/my-feature
gh pr create --title "Add feature"

# Merge (after review)
gh pr merge --squash
EOF
echo ""

echo "Conventional Commits:"
echo "----------------------------------------"
cat << 'EOF'
# Format
<type>(<scope>): <description>

# Types
feat     - New feature
fix      - Bug fix
docs     - Documentation
refactor - Refactoring
test     - Tests
chore    - Maintenance

# Examples
git commit -m "feat(auth): add OAuth2"
git commit -m "fix(api): handle null response"
EOF
