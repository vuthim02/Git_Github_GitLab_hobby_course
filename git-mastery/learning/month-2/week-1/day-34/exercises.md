# Day 34 Exercises: Protected Branches

## Exercise 1: Configure Branch Protection (20 min)

### Objective
Set up branch protection for main branch.

### Steps

1. **Go to repository settings**
   ```
   1. Open repository on GitHub
   2. Click Settings
   3. Click Branches in sidebar
   ```

2. **Add branch protection rule**
   ```
   1. Click "Add branch protection rule"
   2. Branch name pattern: main
   3. Configure:
      ✓ Require pull request reviews
        - Required approving reviews: 1
      ✓ Require status checks to pass before merging
        - Select your CI workflow
      ✓ Include administrators
   4. Click "Create"
   ```

3. **Verify protection**
   - Try to push directly (should fail)
   - Should see error about protection

### Success Criteria
- [ ] Protection rule created
- [ ] Cannot push directly to main
- [ ] Must create PR to merge

---

## Exercise 2: Require Status Checks (20 min)

### Objective
Add required CI checks to protection.

### Steps

1. **Create CI workflow (if not exists)**
   ```bash
   mkdir -p .github/workflows
   # Create ci.yml workflow
   ```

2. **Edit branch protection**
   ```
   Settings → Branches → Edit main
   ```

3. **Add status check requirement**
   ```
   ✓ Require status checks to pass
     - Require branches to be up to date
     - Select checks:
       ✓ CI Pipeline
   ```

4. **Test by creating PR**
   - Create PR to main
   - See Checks tab
   - Cannot merge until green

### Success Criteria
- [ ] Status checks required
- [ ] PR blocks until checks pass
- [ ] Merges blocked if checks fail

---

## Exercise 3: Create CODEOWNERS (25 min)

### Objective
Set up code ownership for your repository.

### Steps

1. **Create CODEOWNERS file**
   ```bash
   mkdir -p .github
   
   cat > .github/CODEOWNERS << 'EOF'
   # Default owner
   * @yourusername
   
   # Frontend
   src/frontend/ @yourusername
   src/components/ @yourusername
   
   # Backend  
   src/backend/ @yourusername
   src/api/ @yourusername
   
   # Workflows
   .github/workflows/ @yourusername
   EOF
   ```

2. **Commit (via PR - protection!)**
   ```bash
   git checkout -b add-codeowners
   git add .github/CODEOWNERS
   git commit -m "Add CODEOWNERS"
   git push -u origin add-codeowners
   
   gh pr create --title "Add CODEOWNERS" --body "Setting up code ownership"
   # Note: You ARE the owner, so you can approve/review
   # But create PR to follow the pattern
   ```

3. **Verify CODEOWNERS**
   - Go to repository
   - See CODEOWNERS file
   - Creates required reviewers based on paths

### Success Criteria
- [ ] CODEOWNERS file created
- [ ] File in .github/
- [ ] Ownership rules defined
- [ ] Shows in PR UI

---

## Exercise 4: Test the Protection System (25 min)

### Objective
Practice full protected branch workflow.

### Complete Workflow

1. **Create a changes**
   ```bash
   git checkout main
   git pull
   git checkout -b feature/test-feature
   
   echo "Test feature" > test-feature.txt
   git add . && git commit -m "Add test feature"
   ```

2. **Push branch**
   ```bash
   git push -u origin feature/test-feature
   ```

3. **Create PR**
   ```
   GitHub → Compare & pull request
   Or: gh pr create
   Title: Test feature
   Description: Testing protection
   ```

4. **Try to merge**
   - Merge button should be disabled
   - Needs approvals
   - Needs status checks

5. **Fix issues**
   - Wait for checks to pass
   - Self-approve if alone

6. **Merge**
   - Merge when all green
   - Delete branch

### Success Criteria
- [ ] PR created
- [ ] Merge blocked
- [ ] Approval check visible
- [ ] Status check visible
- [ ] Successfully merged

---

## Exercise 5: Test Failed Status Check (15 min)

### Objective
Learn to handle failed checks.

### Steps

1. **Intentional failure**
   ```bash
   # In CI workflow, add failing step:
   # - run: npm run test-with-failure
   # This will fail!
   ```

2. **Push to trigger**
   ```bash
   git add .github/
   git commit -m "Add failing test"
   git push
   ```

3. **Observe failure**
   - Checks tab shows red
   - Cannot merge
   - Error message clear

4. **Fix check**
   - Fix the failing code
   - Push fix
   - Check turns green

### Success Criteria
- [ ] Failed check visible
- [ ] Learn to read errors
- [ ] Fix and pass

---

## Challenge Exercise: Complete Protection Setup (30 min)

### Objective
Set up professional protection.

### Requirements

1. **Branch protection**
   - Protect main branch
   - Require 1+ review
   - Require CI checks
   - Include admins

2. **Status checks**
   - Lint check
   - Test check
   - Build check (all required)

3. **CODEOWNERS**
   - Frontend files
   - Backend files
   - Workflow files
   - Documentation

### Success Criteria
- [ ] All protections enabled
- [ ] Required checks in place
- [ ] CODEOWNERS complete
- [ ] Protected PR workflow tested

---

## Review Questions

1. Why should main be protected?
   _______________________________________________

2. What does CODEOWNERS do?
   _______________________________________________

3. What are status checks?
   _______________________________________________

4. How do you merge with protection?
   _______________________________________________

5. What is a quality gate?
   _______________________________________________