# Day 37: GitLab Merge Requests

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 37                                ║
║                          GITLAB MERGE REQUESTS                               ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitLab merge requests (MRs)
- [ ] Create merge requests
- [ ] Review merge requests
- [ ] Use GitLab CLI for MRs
- [ ] Configure MR settings

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: GitLab Merge Requests (equivalent concept)  
**Note**: GitLab MRs work similarly to GitHub PRs

---

## Theory: GitLab Merge Requests

### What are Merge Requests?

A Merge Request (MR) is GitLab's version of a Pull Request. It's a request to merge one branch into another.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     MERGE REQUEST WORKFLOW                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   LOCAL                          GITLAB                                        │
│   ┌─────────────────┐               ┌─────────────────┐                      │
│   │  feature/      │ ── push ────►  │  Merge Request  │                      │
│   │  my-feature    │               │    (MR)         │                      │
│   │                │               │                 │                      │
│   │                │               │    ↓            │                      │
│   │                │               │    Review       │                      │
│   │                │               │    ↓            │                      │
│   │    main        │ ◄── merge ──│    ✓ Approved  │                      │
│   └─────────────────┘               └─────────────────┘                      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### MR vs PR Terminology

| GitHub | GitLab |
|-------|--------|
| Pull Request | Merge Request |
| Review | Review |
| Approve | Approve |
| Request Changes | Request Changes |
| Merge | Merge |
| Squash and Merge | Squash commit |

---

## Creating Merge Requests

### Method 1: Web Interface

1. Push a branch to GitLab
2. GitLab shows banner: "Branch X has new commits"
3. Click "Create merge request"
4. Fill in details:
   - Title
   - Description
   - Source branch
   - Target branch (usually main)
5. Click "Submit merge request"

### Method 2: GitLab CLI (glab)

```bash
# Create MR
glab mr create \
  --title "Add new feature" \
  --description "This adds a new feature" \
  --source-branch feature-branch \
  --target-branch main

# List MRs
glab mr list

# View MR
glab mr view 1

# Approve MR
glab mr approve 1

# Merge MR
glab mr merge 1
```

### Method 3: Push to Create

```bash
git push -u origin feature-branch
# GitLab creates link to create MR
```

---

## Merge Request Features

### Description

```markdown
## Summary
Brief description of changes

## Changes
- Added new feature X
- Fixed bug Y

## Testing
- [ ] Tests pass
- [ ] Manual testing

## Related Issue
Closes #123
```

### Diff View

```
GitLab shows:
- Files changed
- Line-by-line diff
- Comment on specific lines
- Expand/collapse sections
```

### Discussion

- Line comments
- General comments
- Resolve/reopen threads

### Review Actions

```
APPROVE: Approve the MR
REQUEST CHANGES: Request changes
MARKS AS DRAFT: Work in progress
```

---

## MR Settings

### Target Branch

Choose which branch to merge into:
- main (most common)
- develop
- release branch

### Visibility

- Public: Anyone can view (if public project)
- Private: Only project members

### Auto-Merge

Enable to merge when:
- All discussions resolved
- Pipeline passes

### Squash Commits

Option to combine commits before merge.

---

## Practice Exercises

### Exercise 1: Create First MR (15 min)

1. Create a branch
2. Make changes
3. Push branch
4. Create MR via web or CLI

```bash
git checkout -b feature/doc-update
echo "# Updated Docs" > README.md
git add . && git commit -m "Update docs"
git push -u origin feature/doc-update

# Now create MR
glab mr create --title "Update README"
```

### Exercise 2: Review an MR (15 min)

1. View an MR in your project
2. Add inline comments
3. Add general comment
4. Approve the MR

### Exercise 3: Merge an MR (10 min)

1. Ensure pipeline passes
2. Ensure review approved
3. Click "Merge"
4. Delete branch (optional)

---

## Reading References

### GitLab Documentation
- [GitLab Merge Requests](https://docs.gitlab.com/ee/user/project/merge_requests/)
- [Creating Merge Requests](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [Reviewing Merge Requests](https://docs.gitlab.com/ee/user/project/merge_requests/reviews/)
- [Merge Request Settings](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

### GitLab CLI (glab)
- [GitLab CLI Documentation](https://docs.gitlab.com/ee/editor_extensions/gitlab_cli/)
- [glab Installation Guide](https://gitlab.com/gitlab-org/cli)

---

## Checklist

- [ ] Can create merge requests
- [ ] Can review merge requests
- [ ] Can approve and merge
- [ ] Can use GitLab CLI for MRs

---

## Navigation

← [Day 36: GitLab Overview](../day-36/lesson.md) | [Dashboard](../../dashboard.md) | [Day 38: GitLab CI/CD](../day-38/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 37 of 56 (Week 6 - Day 2)  
**Next**: GitLab CI/CD