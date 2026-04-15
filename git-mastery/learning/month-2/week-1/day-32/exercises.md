# Day 32 Exercises: Issues & Projects

## Exercise 1: Create Issue Templates (20 min)

### Objective
Create professional issue templates for your repository.

### Steps

1. **Create directory structure**
   ```bash
   mkdir -p .github/ISSUE_TEMPLATE
   ```

2. **Create bug report template**
   ```bash
   cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
   ---
   name: Bug report
   about: Create a report to help us improve
   title: '[Bug]: '
   labels: bug
   assignees: ''
   ---

   ## Bug Description
   [Description of the bug]

   ## Steps to Reproduce
   1. 
   2. 
   3. 

   ## Expected Behavior
   [What should happen]

   ## Actual Behavior
   [What happens]

   ## Environment
   - OS: 
   - Version: 
   EOF
   ```

3. **Create feature request template**
   ```bash
   cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOF'
   ---
   name: Feature request
   about: Suggest an idea for this project
   title: '[Feature]: '
   labels: enhancement
   assignees: ''
   ---

   ## Feature Description
   [Description of the feature]

   ## Why is this needed?
   [Explain the use case]

   ## Proposed Solution
   [Your proposed solution]
   EOF
   ```

4. **Commit and push**
   ```bash
   git add .github/
   git commit -m "Add issue templates"
   git push
   ```

### Success Criteria
- [ ] Bug report template created
- [ ] Feature request template created
- [ ] Templates appear when creating new issue
- [ ] Committed to repository

---

## Exercise 2: Create Issues for a Project (25 min)

### Objective
Create and manage issues using your new templates.

### Steps

1. **Create three issues using templates**
   ```bash
   # Issue 1: Bug
   gh issue create --title "Bug: Form validation fails" --body "Steps to reproduce..." --label "bug"

   # Issue 2: Feature
   gh issue create --title "Feature: Add dark mode" --body "Proposed solution..." --label "enhancement"

   # Issue 3: Documentation
   gh issue create --title "Docs: API examples missing" --body "Add examples for..." --label "documentation"
   ```

2. **Add labels to existing issues**
   ```bash
   gh issue edit 1 --add-label "priority-high"
   gh issue edit 2 --add-label "frontend"
   ```

3. **List and verify issues**
   ```bash
   gh issue list
   gh issue list --label "bug"
   ```

4. **View specific issue details**
   ```bash
   gh issue view 1
   ```

### Success Criteria
- [ ] All three issues created with correct labels
- [ ] Issues appear on GitHub
- [ ] Can filter by labels
- [ ] Can view issue details

---

## Exercise 3: GitHub Projects Board (30 min)

### Objective
Set up a project board and manage issues visually.

### Steps

1. **Create project board (web interface)**
   ```
   1. Go to repository → Projects tab
   2. Click "New project"
   3. Choose "Board" template
   4. Name: "Sprint Board"
   5. Add columns:
      - Backlog
      - To Do
      - In Progress
      - In Review
      - Done
   ```

2. **Add issues to project**
   ```
   1. Open issue
   2. Right sidebar → Projects
   3. Select Sprint Board
   ```

3. **Organize board**
   - Drag issues to appropriate columns
   - Add issue cards with labels
   - Set due dates on issues

4. **Track progress**
   - Watch columns fill up
   - Move issues as work progresses

### Success Criteria
- [ ] Project board created
- [ ] All issues added to board
- [ ] Issues organized in columns
- [ ] Can drag/move issues

---

## Exercise 4: Milestones (20 min)

### Objective
Create milestones and group related issues.

### Steps

1. **Create milestone via API**
   ```bash
   gh api repos/YOUR_USERNAME/REPO/milestones \
     --method POST \
     --field title="v1.0" \
     --field description="First stable release" \
     --field due_on="2025-03-31T00:00:00Z"
   ```

2. **Add issues to milestone**
   ```bash
   gh issue edit 1 --milestone "v1.0"
   gh issue edit 2 --milestone "v1.0"
   gh issue edit 3 --milestone "v1.0"
   ```

3. **View milestone progress**
   ```
   1. Go to repository → Issues → Milestones
   2. Click on "v1.0"
   3. View progress and due date
   ```

4. **Close milestone when complete**
   ```bash
   gh api repos/YOUR_USERNAME/REPO/milestones/1 \
     --method PATCH \
     --field state="closed"
   ```

### Success Criteria
- [ ] Milestone created
- [ ] Issues added to milestone
- [ ] Progress tracked
- [ ] Due date set

---

## Exercise 5: Labels Deep Dive (15 min)

### Objective
Master labels for issue management.

### Steps

1. **Create custom labels**
   ```bash
   gh label create "priority-critical" --color "FF0000" --description "Critical"
   gh label create "priority-high" --color "FFA500" --description "High priority"
   gh label create "priority-medium" --color "FFFF00" --description "Medium priority"
   gh label create "priority-low" --color "00FF00" --description "Low priority"
   ```

2. **Create type labels**
   ```bash
   gh label create "frontend" --color "0000FF" --description "Frontend work"
   gh label create "backend" --color "00FF00" --description "Backend work"
   gh label create "devops" --color "FF00FF" --description "DevOps work"
   ```

3. **List all labels**
   ```bash
   gh label list
   ```

4. **Apply multiple labels**
   ```bash
   gh issue edit 1 --add-label "bug" --add-label "priority-high" --add-label "frontend"
   ```

### Success Criteria
- [ ] Priority labels created
- [ ] Type labels created
- [ ] Can apply multiple labels
- [ ] Can filter by labels

---

## Exercise 6: Complete Issue Workflow (30 min)

### Objective
Practice complete issue management workflow.

### Complete Workflow

```bash
# 1. Create issue
gh issue create --title "Feature: User profiles" --body "Add user profile pages"

# 2. Add labels
gh issue edit ISSUE_NUM --add-label "enhancement" --add-label "frontend"

# 3. Add to project (via web)
# Projects → Sprint Board → Add card

# 4. Add to milestone
gh issue edit ISSUE_NUM --milestone "v1.0"

# 5. Assign to team member
gh issue edit ISSUE_NUM --add-assignee @teammate

# 6. When work starts, move to "In Progress"
# (Via project board drag)

# 7. Link PR to issue
# PR description: "Closes #ISSUE_NUM"

# 8. When PR merged, close issue
gh issue close ISSUE_NUM
```

### Success Criteria
- [ ] Complete workflow practiced
- [ ] All issue attributes used
- [ ] Project board integrated
- [ ] PR linking understood

---

## Challenge Exercise: Project Management System (45 min)

### Objective
Build a complete project management system.

### Requirements

1. **Repository Setup**
   ```bash
   mkdir -p .github/ISSUE_TEMPLATE
   # Create templates
   ```

2. **Labels**
   - priority: critical, high, medium, low
   - type: bug, enhancement, documentation, question
   - area: frontend, backend, devops, security

3. **Milestones**
   - v1.0 - First Release
   - v2.0 - Second Release

4. **Project Board**
   - Columns: Backlog, To Do, In Progress, In Review, Done

5. **Issues**
   - Minimum 5 issues across different labels
   - Distributed across columns

### Success Criteria
- [ ] All templates working
- [ ] All labels created
- [ ] Milestones created
- [ ] Project board set up
- [ ] Issues properly organized

---

## Review Questions

1. What is the difference between an issue and a pull request?
   _______________________________________________

2. How do issue templates improve collaboration?
   _______________________________________________

3. What is the purpose of milestones?
   _______________________________________________

4. How do you link a PR to an issue?
   _______________________________________________

5. What is the benefit of using project boards?
   _______________________________________________