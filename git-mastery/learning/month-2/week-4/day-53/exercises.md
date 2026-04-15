# Day 53 Exercises: Worktrees

## Exercise 1: Create a Worktree (20 min)

### Objective
Create multiple working directories.

### Scenario
Working on feature A, need to quickly check feature B.

### Steps

1. **Create worktree**
   ```bash
   git worktree add ../feature-b-check feature-b
   ```

2. **Navigate and work**
   ```bash
   cd ../feature-b-check
   # Make changes
   git commit -m "Quick fix"
   ```

3. **Go back to main worktree**
   ```bash
   cd /path/to/main-repo
   ```

4. **List worktrees**
   ```bash
   git worktree list
   ```

### Success Criteria
- [ ] Created worktree
- [ ] Made commits in worktree
- [ ] Listed worktrees

---

## Exercise 2: Remove a Worktree (10 min)

### Steps

1. **Navigate out**
   ```bash
   cd /path/to/main-repo
   ```

2. **Remove worktree**
   ```bash
   git worktree remove ../feature-b-check
   ```

3. **Verify**
   ```bash
   git worktree list
   ```

### Success Criteria
- [ ] Worktree removed
- [ ] Directory cleaned up

---

## Exercise 3: Practical Use Case (20 min)

### Scenario
PR review needs to check another branch while you work.

### Steps

1. **Create worktree for review**
   ```bash
   git worktree add ../pr-review pr-review-branch
   ```

2. **Review in worktree**
   ```bash
   cd ../pr-review
   # Review code
   git log --oneline
   ```

3. **Clean up when done**
   ```bash
   cd /path/to/main-repo
   git worktree remove ../pr-review
   ```

### Success Criteria
- [ ] Review worktree created
- [ ] Review completed
- [ ] Worktree removed
