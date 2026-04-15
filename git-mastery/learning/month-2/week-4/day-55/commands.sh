#!/bin/bash

# Day 55: Git Hooks - Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                   Day 55: Git Hooks - Commands                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Hook Locations:"
echo "----------------------------------------"
cat << 'EOF'
# Local hooks
.git/hooks/

# Common hooks:
# - pre-commit      : Before commit
# - commit-msg      : Commit message validation
# - post-commit     : After commit
# - pre-push        : Before push
# - post-push       : After push
EOF
echo ""

echo "Creating a Pre-Commit Hook:"
echo "----------------------------------------"
cat << 'EOF'
# Create hook file
cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash

# Check for console.log
if git diff --cached | grep -q "console.log"; then
    echo "ERROR: console.log found!"
    exit 1
fi

# Run linting
npm run lint

exit $?
HOOK

chmod +x .git/hooks/pre-commit
EOF
echo ""

echo "Creating a Commit-Msg Hook:"
echo "----------------------------------------"
cat << 'EOF'
cat > .git/hooks/commit-msg << 'HOOK'
#!/bin/bash

msg=$(cat "$1")

# Check conventional commit format
if ! echo "$msg" | grep -qE "^(feat|fix|docs|chore):"; then
    echo "ERROR: Use format: feat: message"
    exit 1
fi

exit 0
HOOK

chmod +x .git/hooks/commit-msg
EOF
echo ""

echo "Using Husky (Recommended):"
echo "----------------------------------------"
cat << 'EOF'
# Install husky
npm install husky --save-dev

# Initialize
npx husky install

# Add a hook
npx husky add .husky/pre-commit "npm test"

# Add to package.json
npm pkg set scripts.prepare="husky install"
EOF
