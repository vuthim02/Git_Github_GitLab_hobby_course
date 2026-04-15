#!/bin/bash

# Day 48: Release Management - Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║               Day 48: Release Management - Commands                 ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Semantic Versioning:"
echo "----------------------------------------"
cat << 'EOF'
MAJOR.MINOR.PATCH
  |    |    |
  |    |    └── Patch version (bug fixes)
  |    └─────── Minor version (new features, backwards compatible)
  └──────────── Major version (breaking changes)

Examples:
v1.0.0 - Initial release
v1.1.0 - New feature, backwards compatible
v1.1.1 - Bug fix
v2.0.0 - Breaking changes
EOF
echo ""

echo "Creating Tags:"
echo "----------------------------------------"
cat << 'EOF'
# Create lightweight tag
git tag v1.0.0

# Create annotated tag (recommended)
git tag -a v1.0.0 -m "Release version 1.0.0"

# Tag specific commit
git tag -a v1.0.0 abc1234 -m "Release version 1.0.0"

# Push tag to remote
git push origin v1.0.0

# Push all tags
git push --tags
EOF
echo ""

echo "GitHub Releases:"
echo "----------------------------------------"
cat << 'EOF'
# Create release via GitHub CLI
gh release create v1.0.0 \
  --title "Version 1.0.0" \
  --notes "Release notes here"

# Create from tag
gh release create v1.0.0 \
  --title "Version 1.0.0" \
  --generate-notes  # Auto-generate from commits
EOF
echo ""

echo "Listing and Deleting Tags:"
echo "----------------------------------------"
cat << 'EOF'
# List tags
git tag
git tag -l "v1.*"

# Delete local tag
git tag -d v1.0.0

# Delete remote tag
git push origin --delete v1.0.0
EOF
