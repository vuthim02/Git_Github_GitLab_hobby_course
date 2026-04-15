# Day 44 Exercises: GitHub Flow

## Exercise 1: Implement GitHub Flow (30 min)

### Objective
Set up a project using GitHub Flow.

### Steps

1. **Create repository and enable GitHub Pages**
   ```bash
   gh repo create github-flow-demo --public --clone
   cd github-flow-demo
   git checkout -b main
   echo "# GitHub Flow Demo" > README.md
   git add . && git commit -m "Initial commit"
   git push -u origin main
   # Enable GitHub Pages in settings
   ```

2. **Create first feature branch**
   ```bash
   git checkout -b feature/add-header
   cat > index.html << 'EOF'
   <!DOCTYPE html>
   <html>
   <head><title>Demo</title></head>
   <body><h1>GitHub Flow Demo</h1></body>
   </html>
   EOF
   git add . && git commit -m "Add HTML structure"
   git push -u origin feature/add-header
   ```

3. **Create PR and merge**
   ```bash
   gh pr create --title "Add header" --body "Adds basic HTML structure"
   # Review and merge on GitHub
   ```

4. **Verify deployment**
   - Check GitHub Pages URL
   - Confirm changes are live

### Success Criteria
- [ ] Main branch always deployable
- [ ] Feature branches for all changes
- [ ] All changes through PR
- [ ] Automatic deployment verified

---

## Exercise 2: Compare Git Flow vs GitHub Flow (20 min)

### Objective
Understand when to use each workflow.

### Task: Fill in the comparison

| Aspect | Git Flow | GitHub Flow |
|--------|----------|-------------|
| Branch types | ____ | ____ |
| Release process | ____ | ____ |
| Best for | ____ | ____ |
| Deployment | ____ | ____ |
| Complexity | ____ | ____ |

### When to Use Each

**Use Git Flow when:**
- _________________________________
- _________________________________
- _________________________________

**Use GitHub Flow when:**
- _________________________________
- _________________________________
- _________________________________

---

## Exercise 3: Hotfix Workflow (25 min)

### Objective
Practice emergency fix procedure in GitHub Flow.

### Scenario
Production has a critical bug that needs immediate fix.

### Steps

1. **Create hotfix branch from main**
   ```bash
   git checkout main
   git pull
   git checkout -b hotfix/critical-bug
   ```

2. **Make the fix**
   ```bash
   # Fix the bug
   git add . && git commit -m "Fix critical bug in production"
   ```

3. **Create PR directly to main**
   ```bash
   gh pr create \
     --title "HOTFIX: Critical bug fix" \
     --body "Critical bug in production. Fixes #123."
   ```

4. **Merge and verify**
   - Merge immediately
   - Verify on production
   - Deployment should happen automatically

### Success Criteria
- [ ] Hotfix branch from main
- [ ] Quick fix applied
- [ ] PR with clear HOTFIX label
- [ ] Merged and deployed
