# Day 32: Issues & Projects

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 32                                 ║
║                          ISSUES & PROJECTS                                    ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitHub Issues
- [ ] Create effective issues
- [ ] Use GitHub Projects (Kanban boards)
- [ ] Manage labels and milestones
- [ ] Create issue templates
- [ ] Track project progress

---

## Theory: GitHub Issues

### What is a GitHub Issue?

An Issue is a **unit of work** in GitHub. It's used to track:
- Bugs
- Feature requests
- Tasks
- Questions
- Documentation improvements

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           ISSUE ANATOMY                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Issue Title (Clear, concise)                                              │
│   ───────────────────────────────────────                                   │
│                                                                             │
│   Description                                                              │
│   ├─ What is the problem/feature?                                          │
│   ├─ Expected behavior                                                     │
│   ├─ Steps to reproduce (for bugs)                                         │
│   └─ Environment details                                                   │
│                                                                             │
│   Metadata                                                                 │
│   ├─ Labels: bug, enhancement, help wanted                                 │
│   ├─ Milestone: v1.0, v2.0                                                 │
│   ├─ Assignee: @username                                                   │
│   └─ Projects: My Project                                                  │
│                                                                             │
│   Activity                                                                 │
│   ├─ Comments from team                                                    │
│   ├─ Timeline of events                                                   │
│   └─ Linked PRs                                                            │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Why Use Issues?

1. **Track work** - Know what needs to be done
2. **Prioritize** - Organize by importance
3. **Assign** - Know who's responsible
4. **Discuss** - Centralized conversation
5. **Link** - Connect to PRs and commits

---

## Creating Effective Issues

### Issue Title

**Good:**
```
Bug: Login fails when password contains special characters
Feature: Add dark mode support
Documentation: Add API usage examples
```

**Bad:**
```
Problem
It doesn't work
Login issue
Feature request
```

### Issue Template

```markdown
## Bug Description
[Clear description of the bug]

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
[What you expected to happen]

## Actual Behavior
[What actually happened]

## Screenshots
[If applicable]

## Environment
- OS: [e.g., macOS 12.0]
- Browser: [e.g., Chrome 95]
- Version: [e.g., 1.2.3]

## Additional Context
[Any other context]
```

### Creating Issue Template

```bash
mkdir -p .github
cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
## Bug Description
[Description]

## Steps to Reproduce
1.
2.
3.

## Expected Behavior
[Expected]

## Actual Behavior
[Actual]

## Screenshots
[Screenshots]
EOF
```

---

## GitHub Projects (Kanban)

### What is GitHub Projects?

A **visual project management** tool. Think Trello/Jira built into GitHub.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         GITHUB PROJECTS BOARD                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   TO DO           │   IN PROGRESS     │   IN REVIEW    │   DONE          │
│   ┌───────────┐  │   ┌───────────┐   │   ┌─────────┐ │   ┌─────────┐    │
│   │ Issue #12 │  │   │ Issue #8  │   │   │Issue #15│ │   │ Issue #3│    │
│   │ 🔴 Bug    │  │   │ 💡 Feature│   │   │ 🔴 Bug  │ │   │ ✅ Done │    │
│   │ @alice    │  │   │ @bob      │   │   │ @carol  │ │   │ @dave   │    │
│   └───────────┘  │   └───────────┘   │   └─────────┘ │   └─────────┘    │
│   ┌───────────┐  │                   │               │   ┌─────────┐    │
│   │ Issue #20 │  │                   │               │   │Issue #11│    │
│   │ 📚 Docs   │  │                   │               │   │ ✅ Done │    │
│   │ @eve      │  │                   │               │   └─────────┘    │
│   └───────────┘  │                   │               │                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Creating a Project

1. Click **Projects** tab
2. Click **New project**
3. Choose template:
   - Board (default)
   - Table
   - Roadmap
4. Name your project
5. Add columns (for Board view)

### Project Columns

**Typical columns:**
- To Do / Backlog
- In Progress
- In Review
- Done

### Adding Issues to Project

```bash
# Via GitHub CLI
gh issue edit 123 --add-project "My Project"

# Via web interface
# Issue page → Projects → Select project

# Auto-add via template
# In .github/issue_template.md:
# ---
# projects: ["my-org/my-project"]
# ---
```

---

## Labels

### Default Labels

| Label | Color | Purpose |
|-------|-------|---------|
| bug | 🔴 Red | Something isn't working |
| enhancement | 💡 Purple | New feature or request |
| documentation | 📚 Blue | Improvements to docs |
| help wanted | 🟢 Green | Looking for contributors |
| good first issue | 🌟 Orange | Good for newcomers |
| question | ❓ Gray | Further info requested |
| wontfix | ⬛ Black | This will not be worked on |

### Creating Custom Labels

```bash
# Create label via CLI
gh label create "priority-high" --color "FF0000" --description "High priority"

# Or via web:
# Issues → Labels → New label
```

### Label Naming Conventions

```
Type labels:
- bug
- enhancement
- feature
- documentation
- refactor
- test

Priority labels:
- priority: critical
- priority: high
- priority: medium
- priority: low

Status labels:
- status: needs-review
- status: blocked
- needs-information
```

---

## Milestones

### What are Milestones?

**Groups of issues/PRs** that share a target date or goal.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         MILESTONE: v1.0                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Progress: 3/8 issues completed (38%)                                      │
│                                                                             │
│   Issues:                                                                   │
│   [✓] Issue #10 - Setup CI/CD                                              │
│   [✓] Issue #15 - Add tests                                                 │
│   [✓] Issue #22 - Documentation                                             │
│   [○] Issue #30 - User login (in progress)                                  │
│   [○] Issue #31 - User registration                                         │
│   [○] Issue #32 - Password reset                                            │
│   [○] Issue #33 - Email verification                                         │
│   [○] Issue #34 - 2FA support                                               │
│                                                                             │
│   Due: December 31, 2024                                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Creating Milestones

```bash
# Create milestone
gh api repos/owner/repo/milestones \
  --method POST \
  --field title="v1.0" \
  --field description="First stable release" \
  --field due_on="2024-12-31T00:00:00Z"

# Or via CLI (if supported)
gh milestone create --title "v1.0" --due "2024-12-31"
```

### Linking Issues to Milestones

```bash
# Add issue to milestone
gh issue edit 123 --milestone "v1.0"

# View milestone progress
gh api repos/owner/repo/milestones/v1.0
```

---

## Practice Exercises

### Exercise 1: Create Issue Templates (20 min)

1. Create `.github/ISSUE_TEMPLATE` directory
2. Create `bug_report.md` template
3. Create `feature_request.md` template
4. Test by creating a new issue

```bash
mkdir -p .github/ISSUE_TEMPLATE

cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
## Bug Description
A clear description of the bug.

## Steps to Reproduce
1. 
2. 
3. 

## Expected Behavior
What should happen.

## Actual Behavior
What actually happens.

## Environment
- OS: 
- Version: 

## Screenshots
[Screenshots if applicable]
EOF
```

### Exercise 2: Set Up GitHub Project (25 min)

1. Create a new project board
2. Add columns: To Do, In Progress, Done
3. Create issues for a feature
4. Add issues to the board
5. Move them through columns

```bash
# Create issues
gh issue create --title "Setup database" --body "..." --label "enhancement"
gh issue create --title "Create API endpoints" --body "..." --label "enhancement"
gh issue create --title "Add authentication" --body "..." --label "enhancement"

# Add to project (via web for now)
# Or use project CLI
gh api graphql -f query='...'
```

### Exercise 3: Use Labels Effectively (15 min)

1. Create custom labels for your project
2. Apply labels to issues
3. Filter issues by label

```bash
# Create labels
gh label create "priority-high" --color "FF0000"
gh label create "needs-design" --color "FFA500"
gh label create "frontend" --color "0000FF"

# List all labels
gh label list

# Filter by label
gh issue list --label "bug"
gh issue list --label "priority-high"
```

---

## Checklist

- [ ] I understand what GitHub Issues are for
- [ ] I can create effective issues with good titles
- [ ] I can create issue templates
- [ ] I understand GitHub Projects
- [ ] I can create and manage a project board
- [ ] I can use labels effectively
- [ ] I can create and use milestones
- [ ] I can link issues to PRs

---

## Commands Reference

```bash
# Issues
gh issue create --title "Title" --body "Description"
gh issue list
gh issue view 123
gh issue edit 123 --title "New title"
gh issue close 123
gh issue reopen 123

# Labels
gh label list
gh label create "name" --color "color" --description "desc"

# Milestones
gh api repos/owner/repo/milestones --method POST \
  --field title="v1.0"

# Projects
gh api graphql -f query='...'  # Complex
# Use web interface for most operations
```

---

## Reading References

- [GitHub: Mastering Issues](https://guides.github.com/features/issues/)
- [GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [Issue Templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)

---

## Tomorrow's Preview

**Day 33: GitHub Actions Intro**

Tomorrow you'll learn:
- What is CI/CD
- GitHub Actions basics
- Creating workflows
- Running tests automatically
- Deploying with Actions

---

## Navigation

← [Day 31: Code Reviews](../day-31/lesson.md) | [Dashboard](../../dashboard.md) | [Day 33: GitHub Actions Intro](../day-33/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 32 of 56 (Week 5 - Day 4)  
**Next**: GitHub Actions Intro
