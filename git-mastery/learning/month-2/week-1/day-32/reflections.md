# Day 32 Reflections: Issues & Projects

## What I Learned Today

### Key Takeaways

1. **GitHub Issues**
   - Unit of work tracking
   - Can track bugs, features, tasks, questions
   - Components: title, body, labels, milestone, assignee, project
   - Linkable to PRs and commits

2. **Effective Issue Writing**
   - Clear, specific titles
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Environment details
   - Screenshots when relevant

3. **GitHub Projects**
   - Visual Kanban boards
   - Track work across columns
   - Custom fields
   - Integration with issues

4. **Labels**
   - Categorization
   - Filtering
   - Priority indicators
   - Type markers

5. **Milestones**
   - Group related issues
   - Release tracking
   - Due dates
   - Progress percentage

### Commands Mastered

```bash
# Issues
gh issue create --title "Title" --body "Description"
gh issue list
gh issue view 42
gh issue edit 42 --title "New title"
gh issue edit 42 --add-label "bug"
gh issue edit 42 --milestone "v1.0"
gh issue edit 42 --add-assignee @user
gh issue close 42
gh issue reopen 42

# Labels
gh label list
gh label create "name" --color "color" --description "desc"

# Templates
mkdir -p .github/ISSUE_TEMPLATE
```

### Mental Model

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      ISSUE LIFECYCLE                                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   CREATE ─────► ASSIGN ─────► TRACK ─────► REVIEW ─────► CLOSE              │
│       │            │            │            │            │                      │
│       ▼            ▼            ▼            ▼            ▼                      │
│   Title+Desc   Owner+     Project+    PR Links   Fixed+                        │
│   Template     Labels     Milestone   Changes   Merged                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      PROJECT BOARD FLOW                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌────────┐  ┌──────────┐  ┌───────────┐  ┌────────┐                    │
│   │ BACKLOG│►│  TO DO   │►│IN PROGRESS│►│  DONE  │                    │
│   │        │  │          │  │           │  │        │                    │
│   │ Issue  │  │ Issue #1 │  │ Issue #2  │  │ Issue #│                    │
│   │  #5   │  │          │  │           │  │  #3   │                    │
│   └────────┘  └──────────┘  └───────────┘  └────────┘                    │
│                                                                             │
│   ───────────────────────────────────────────────────────                     │
│   Issue #4: PR merged, moves from In Progress to Done                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Aha Moments

- "Issues are the backbone of project management"
- "Templates ensure consistent information"
- "Project boards make progress visible"
- "Labels + Milestones = Filterable tracking"

### Questions to Explore Further

1. How do organizations use Projects v2 (beta)?
2. What are automation features in projects?
3. How to create custom fields in Project v2?
4. What is the difference between Projects v1 and v2?
5. How to automate issue assignments?

### Tomorrow's Preview

**Day 33: GitHub Actions Intro**

Tomorrow I'll learn:
- What is CI/CD
- GitHub Actions basics
- Creating workflows
- Running tests automatically
- Deploying with Actions

### Confidence Check

Rate your understanding (1-5):
- [ ] Creating effective issues: ____
- [ ] Using issue templates: ____
- [ ] GitHub Projects boards: ____
- [ ] Label management: ____
- [ ] Milestone tracking: ____

## Practice Log

Today I practiced by:
1. ______________________________________
2. ______________________________________
3. ______________________________________

## Notes

- ______________________________________
- ______________________________________
- ______________________________________