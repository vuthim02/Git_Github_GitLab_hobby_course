#!/bin/bash

# Day 32: Issues & Projects - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                   Day 32: Issues & Projects - Commands              ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: Creating Issues
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: Creating Issues"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create issue via GitHub CLI"
echo "----------------------------------------"
cat << 'EOF'
# Basic issue
gh issue create --title "Bug: Login fails" --body "Description here"

# With labels
gh issue create \
  --title "Bug: Login fails with special characters" \
  --body "Steps to reproduce:..." \
  --label "bug" \
  --label "priority-high"

# With milestone
gh issue create --title "Feature: Dark mode" --body "..." --milestone "v1.0"

# With assignee
gh issue create --title "Task: Update docs" --body "..." --assignee "@octocat"
EOF
echo ""

echo "With project board"
echo "----------------------------------------"
cat << 'EOF'
# Note: Projects require web or GraphQL API for now
# gh api graphql -f query='mutation { addProjectV2ItemById... }'

# Alternative: Add project via web
# Issue → Projects → Select project
EOF
echo ""

# ============================================
# SECTION 2: Listing and Viewing Issues
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: Listing and Viewing Issues"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "List all open issues"
echo "----------------------------------------"
echo "gh issue list"
echo "# Output:"
echo "# NUMBER  TITLE                          STATE   LABELS"
echo "# 42      Bug: Login fails             OPEN    bug, priority-high"
echo ""

echo "List issues with filters"
echo "----------------------------------------"
cat << 'EOF'
gh issue list --state all              # All issues (open + closed)
gh issue list --state closed         # Only closed
gh issue list --author @me         # Your issues
gh issue list --assignee @me         # Assigned to you
gh issue list --label "bug"          # Issues with bug label
gh issue list --label "priority-high"
gh issue list --milestone "v1.0"   # Issues in milestone
gh issue list --search "is:issue is:open"  # GitHub search syntax
EOF
echo ""

echo "View specific issue"
echo "----------------------------------------"
cat << 'EOF'
gh issue view 42                  # View issue #42
gh issue view 42 --json title,state,body  # JSON output
gh issue view 42 --comments      # Include comments
gh issue view 42 --timeline    # Show timeline
EOF
echo ""

# ============================================
# SECTION 3: Managing Issues
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Managing Issues"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Edit issue"
echo "----------------------------------------"
cat << 'EOF'
# Change title
gh issue edit 42 --title "New title"

# Change body/description
gh issue edit 42 --body "New description"

# Add/remove labels
gh issue edit 42 --add-label "bug" --add-label "security"
gh issue edit 42 --remove-label "enhancement"

# Change milestone
gh issue edit 42 --milestone "v1.0"
gh issue edit 42 --milestone ""   # Remove milestone

# Change assignee
gh issue edit 42 --add-assignee @octocat
gh issue edit 42 --remove-assignee @octocat
EOF
echo ""

echo "Close/reopen issue"
echo "----------------------------------------"
cat << 'EOF'
gh issue close 42
gh issue reopen 42
EOF
echo ""

echo "Add issue to project"
echo "----------------------------------------"
cat << 'EOF'
# Via web interface:
# 1. Go to issue
# 2. Right sidebar → Projects
# 3. Select project

# Note: Use GitHub web for project management
# API requires GraphQL for complex operations
EOF
echo ""

# ============================================
# SECTION 4: Labels Management
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: Labels Management"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "List labels"
echo "----------------------------------------"
echo "gh label list"
echo ""

echo "Create label"
echo "----------------------------------------"
cat << 'EOF'
gh label create "priority-critical" \
  --color "FF0000" \
  --description "Critical priority issue"

gh label create "frontend" \
  --color "0000FF" \
  --description "Frontend related"

gh label create "backend" \
  --color "00FF00" \
  --description "Backend related"
EOF
echo ""

echo "Edit label"
echo "----------------------------------------"
cat << 'EOF'
gh label edit "priority-critical" --name "p0-critical"
gh label edit "priority-critical" --color "FF4500"
gh label edit "priority-critical" --description "P0 critical"
EOF
echo ""

echo "Delete label"
echo "----------------------------------------"
cat << 'EOF'
gh label delete "old-label"
EOF
echo ""

# ============================================
# SECTION 5: Milestones Management
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Milestones Management"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "List milestones"
echo "----------------------------------------"
cat << 'EOF'
# Note: Direct CLI support is limited
# Use API for milestone operations

# List via API
curl -s -H "Authorization: Bearer TOKEN" \
  https://api.github.com/repos/OWNER/REPO/milestones
EOF
echo ""

echo "Create milestone via API"
echo "----------------------------------------"
cat << 'EOF'
gh api repos/OWNER/REPO/milestones \
  --method POST \
  --field title="v2.0" \
  --field description="Second major release" \
  --field due_on="2025-06-30T00:00:00Z"
EOF
echo ""

echo "Edit milestone"
echo "----------------------------------------"
cat << 'EOF'
gh api repos/OWNER/REPO/milestones/1 \
  --method PATCH \
  --field title="v2.0" \
  --field state="open"
EOF
echo ""

# ============================================
# SECTION 6: GitHub Projects
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 6: GitHub Projects (Web Interface)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Creating a Project"
echo "----------------------------------------"
echo "1. Go to your repository"
echo "2. Click 'Projects' tab"
echo "3. Click 'New project'"
echo "4. Choose template (Board recommended)"
echo "5. Name your project"
echo "6. Add columns:"
echo "   - To Do / Backlog"
echo "   - In Progress"
echo "   - In Review"
echo "   - Done"
echo ""

echo "Managing Issues via Projects"
echo "----------------------------------------"
echo "1. Create issue on GitHub"
echo "2. Open Projects board"
echo "3. Drag issue to appropriate column"
echo "4. Add fields (Status, Priority, etc.)"
echo ""

echo "Project Custom Fields"
echo "----------------------------------------"
echo "Add custom fields to track:"
echo "- Status (multi-select)"
echo "- Priority (single-select)"
echo "- Due Date (date)"
echo "- Assignee (people)"
echo "- labels (labels)"
echo ""

# ============================================
# SECTION 7: Issue Templates
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 7: Issue Templates"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create issue templates directory"
echo "----------------------------------------"
cat << 'EOF'
mkdir -p .github/ISSUE_TEMPLATE
EOF
echo ""

echo "Create bug report template"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
---
name: Bug report
about: Create a report to help us improve
title: '[Bug]: '
labels: bug
assignees: ''

---

## Bug Description
[Clear and concise description of what the bug is.]

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
[What you expected to happen.]

## Actual Behavior
[What actually happened instead.]

## Screenshots
[If applicable, add screenshots to help explain your problem.]

## Environment
- OS: [e.g., macOS 12.0]
- Browser: [e.g., Chrome 95]
- Version: [e.g., 1.2.3]

## Additional Context
[Add any other context about the problem here.]
EOF
EOF
echo ""

echo "Create feature request template"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOF'
---
name: Feature request
about: Suggest an idea for this project
title: '[Feature]: '
labels: enhancement
assignees: ''

---

## Is your feature request related to a problem?
[A clear and concise description of what the problem is.]

## Describe the solution you'd like
[A clear and concise description of what you want to happen.]

## Describe alternatives you've considered
[A clear and concise description of any alternative solutions or features you've considered.]

## Additional Context
[Add any other context about the feature request here.]
EOF
EOF
echo ""

echo "Create config.yml for template selection"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/ISSUE_TEMPLATE/config.yml << 'EOF'
blank_issues_enabled: true
contact_links:
  - name: GitHub Community
    url: https://github.community
    about: Please ask and answer general questions here.
EOF
EOF
echo ""

# ============================================
# SECTION 8: Complete Workflow
# ============================================
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              COMPLETE PROJECT MANAGEMENT WORKFLOW                    ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

cat << 'EOF'
# Step 1: Set up project structure
mkdir -p .github/ISSUE_TEMPLATE

# Step 2: Create issue templates
# (See Section 7 above)

# Step 3: Create milestones
gh api repos/OWNER/REPO/milestones \
  --method POST \
  --field title="v1.0" \
  --field due_on="2024-12-31T00:00:00Z"

# Step 4: Create labels
gh label create "priority-high" --color "FF0000" --description "High priority"
gh label create "frontend" --color "0000FF" --description "Frontend"

# Step 5: Create project board (via web)
# Projects → New project → Board

# Step 6: Create issues
gh issue create --title "Setup CI/CD" --body "Set up GitHub Actions" --label "enhancement"
gh issue create --title "Fix login bug" --body "Login fails with special chars" --label "bug"

# Step 7: Add to project and milestone
gh issue edit 1 --milestone "v1.0"

# Step 8: Assign to team member
gh issue edit 1 --add-assignee @teammate
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"