#!/bin/bash

# Day 47: Commit Conventions - Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║               Day 47: Commit Conventions - Commands                 ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Conventional Commits Format:"
echo "----------------------------------------"
cat << 'EOF'
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
EOF
echo ""

echo "Common Commit Types:"
echo "----------------------------------------"
cat << 'EOF'
feat     - New feature
fix      - Bug fix
docs     - Documentation
style    - Formatting
refactor - Code refactoring
test     - Adding tests
chore    - Maintenance
perf     - Performance
ci       - CI/CD
EOF
echo ""

echo "Examples:"
echo "----------------------------------------"
cat << 'EOF'
# Feature
git commit -m "feat(auth): add OAuth2 login"

# Bug fix
git commit -m "fix(api): handle null response"

# Documentation
git commit -m "docs(readme): update installation"

# Breaking change
git commit -m "feat(payment)!: change API response format"
git commit -m "BREAKING CHANGE: payment API returns different format"
EOF
echo ""

echo "Enforce with Commitlint:"
echo "----------------------------------------"
cat << 'EOF'
# Install
npm install -D @commitlint/cli @commitlint/config-conventional

# commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional']
};

# Add to package.json scripts
"commitlint": "commitlint -e"
EOF
