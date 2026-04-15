#!/bin/bash

# Day 35: Week 5 Review - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Day 35: Week 5 Review - Commands                      ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# Week 5 Quick Reference
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Week 5 Commands Quick Reference"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

cat << 'EOF'
# GITHUB REPOSITORIES
gh auth login
gh repo create NAME --public
gh repo create NAME --private
gh repo clone USER/REPO
git remote add origin URL
git push -u origin main

# PULL REQUESTS
gh pr create --title "Title" --body "Desc"
gh pr list
gh pr view NUM
gh pr review NUM --approve
gh pr merge NUM --squash

# ISSUES
gh issue create --title "Title" --body "Desc"
gh issue list
gh issue view NUM
gh issue edit NUM --label "bug"

# ACTIONS
# No CLI - YAML files in .github/workflows/

# PROTECTION
# Via web: Settings → Branches → Add rule

# CODEOWNERS
# .github/CODEOWNERS file
EOF

echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                     WEEK 5 COMPLETE!                              ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"