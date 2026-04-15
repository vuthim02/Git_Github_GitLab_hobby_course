# Day 30 Exercises: Pull Requests Deep Dive

## Exercise 1: Create Your First PR (20 min)

### Objective
Create a complete Pull Request with proper description.

### Steps

1. **Create a repository**
   ```bash
   gh repo create pr-practice --public --clone
   cd pr-practice
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b add-contributing-guide
   ```

3. **Make changes**
   ```bash
   cat > CONTRIBUTING.md << 'EOF'
   # Contributing Guide

   ## How to contribute

   1. Fork the repository
   2. Create your feature branch
   3. Make your changes
   4. Submit a pull request

   ## Code style

   - Use meaningful variable names
   - Add comments for complex logic
   - Write tests for new features
   EOF
   ```

4. **Commit and push**
   ```bash
   git add . && git commit -m "Add contributing guide"
   git push -u origin add-contributing-guide
   ```

5. **Create PR with good description**
   ```bash
   gh pr create \
     --title "Add contributing guide" \
     --body "## Summary
   This PR adds a CONTRIBUTING.md file to help new contributors.

   ## Changes
   - Added contribution process
   - Added code style guidelines

   ## Motivation
   We need this to help onboard new contributors.

   ## Testing
   - [x] Readme displays correctly
   - [x] Links work"
   ```

### Success Criteria
- [ ] PR created successfully
- [ ] Title is clear and descriptive
- [ ] Body has all required sections
- [ ] PR visible on GitHub

---

## Exercise 2: Create a PR Template (15 min)

### Objective
Set up automatic PR template for your repository.

### Steps

1. **Create .github directory**
   ```bash
   cd pr-practice
   mkdir -p .github
   ```

2. **Create PULL_REQUEST_TEMPLATE.md**
   ```bash
   cat > .github/PULL_REQUEST_TEMPLATE.md << 'EOF'
   ## What does this PR do?
   <!-- Brief description of changes -->

   ## Related issue
   <!-- Fixes #(issue number) -->

   ## How to test
   1. 
   2. 
   3. 

   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-reviewed
   - [ ] Tests added/updated
   - [ ] Documentation updated
   - [ ] No console.log or debug code
   EOF
   ```

3. **Commit and push**
   ```bash
   git add . && git commit -m "Add PR template"
   git push
   ```

4. **Verify**
   - Create a new branch and PR
   - Check that template auto-fills

### Success Criteria
- [ ] Template file created
- [ ] Template appears in new PRs
- [ ] All sections present

---

## Exercise 3: Squash Commits (25 min)

### Objective
Learn to clean up commit history before merging.

### Scenario
You've made 5 small commits while working on a feature, but want to squash them into one clean commit.

### Steps

1. **Create multiple commits**
   ```bash
   git checkout -b feature-cleanup
   echo "Feature 1" > feature.txt && git add . && git commit -m "Add feature"
   echo "Feature 2" >> feature.txt && git add . && git commit -m "Update feature"
   echo "Feature 3" >> feature.txt && git add . && git commit -m "Finalize feature"
   echo "Fix typo" >> feature.txt && git add . && git commit -m "Fix typo"
   echo "Add comment" >> feature.txt && git add . && git commit -m "Add comment"
   ```

2. **View commits**
   ```bash
   git log --oneline
   # Should see 5 commits
   ```

3. **Squash using interactive rebase**
   ```bash
   git rebase -i HEAD~5
   ```

4. **In editor, change to:**
   ```
   pick abc1234 Add feature
   squash def5678 Update feature
   squash 9123456 Finalize feature
   squash aabbccdd Fix typo
   squash eeff0011 Add comment
   ```

5. **Save and close editor**

6. **Result:**
   - Only one commit remains
   - Contains all changes combined

7. **Push**
   ```bash
   git push --force-with-lease origin feature-cleanup
   ```

### Alternative: GitHub Squash

1. On GitHub, merge using "Squash and merge" button
2. GitHub handles the squashing automatically

### Success Criteria
- [ ] Multiple commits squashed into one
- [ ] PR shows single commit
- [ ] All changes preserved

---

## Exercise 4: Review a PR (20 min)

### Objective
Practice the code review process.

### Steps

1. **Find a PR to review**
   ```bash
   # Find open PRs in a popular repo
   gh pr list --repo microsoft/vscode --state open --limit 5
   ```

2. **Checkout the PR**
   ```bash
   gh pr checkout 12345
   # Creates local branch with PR changes
   ```

3. **Review the code**
   ```bash
   # View changes
   git log --oneline -10
   git diff main...HEAD

   # Look at specific files
   cat filename.js
   ```

4. **Add review comments**
   ```bash
   # Comment on the PR overall
   gh pr review 12345 --comment --body "Nice implementation!

   Consider:
   - Adding more error handling
   - Writing unit tests

   But overall looks good!"

   # Or approve
   gh pr review 12345 --approve --body "LGTM! Ship it."
   ```

### Success Criteria
- [ ] Checked out PR locally
- [ ] Reviewed the changes
- [ ] Added constructive comments

---

## Exercise 5: Compare Merge Strategies (30 min)

### Objective
Understand the differences between merge strategies.

### Setup

Create a repo and test each merge strategy:

```bash
# Create repo
gh repo create merge-test --public --clone
cd merge-test

# Create initial commit
echo "Initial" > file.txt
git add . && git commit -m "Initial commit"
git push -u origin main
```

### Test 1: Regular Merge

```bash
# Create branch with 3 commits
git checkout -b feature-a
echo "Change 1" >> file.txt && git add . && git commit -m "Change 1"
echo "Change 2" >> file.txt && git add . && git commit -m "Change 2"
echo "Change 3" >> file.txt && git add . && git commit -m "Change 3"
git push -u origin feature-a

# Create PR and merge normally
gh pr create --title "Feature A" --body "Testing regular merge"
# Merge on GitHub (Create a merge commit)
```

### Test 2: Squash Merge

```bash
# Create another feature branch
git checkout main
git pull
git checkout -b feature-b
echo "Change 1" >> file.txt && git add . && git commit -m "Change 1"
echo "Change 2" >> file.txt && git add . && git commit -m "Change 2"
echo "Change 3" >> file.txt && git add . && git commit -m "Change 3"
git push -u origin feature-b

# Create PR
gh pr create --title "Feature B" --body "Testing squash merge"
# Merge on GitHub (Squash and merge)
```

### Test 3: Rebase Merge

```bash
# Create branch
git checkout main
git pull
git checkout -b feature-c
echo "Change 1" >> file.txt && git add . && git commit -m "Change 1"
echo "Change 2" >> file.txt && git add . && git commit -m "Change 2"
echo "Change 3" >> file.txt && git add . && git commit -m "Change 3"
git push -u origin feature-c

# Create PR
gh pr create --title "Feature C" --body "Testing rebase merge"
# Merge on GitHub (Rebase and merge)
```

### Compare Results

After all three merges:
```bash
git log --oneline --graph
```

**Observe:**
- Merge: Shows merge commit, all 3 commits visible
- Squash: Single commit, all 3 commits combined
- Rebase: 3 commits, no merge commit, rebased onto main

### Success Criteria
- [ ] Tested all three merge strategies
- [ ] Can explain differences
- [ ] Can choose appropriate strategy

---

## Challenge Exercise: Collaborative PR Workflow (45 min)

### Objective
Simulate a complete collaborative PR workflow.

### Scenario
You and a teammate are working on a feature. Your teammate opens a PR, you review it, request changes, they update, you approve, and then merge.

### Steps

1. **Friend opens PR (simulated)**
   - Create a PR for the `add-contributing-guide` branch
   - Add a reviewer if possible (or just practice the flow)

2. **Review the PR**
   ```bash
   gh pr view add-contributing-guide
   gh pr diff add-contributing-guide
   ```

3. **Request changes (if needed)**
   ```bash
   gh pr review add-contributing-guide \
     --request-changes \
     --body "Please add a section about coding standards."
   ```

4. **Update PR (pretend changes made)**
   ```bash
   echo "" >> CONTRIBUTING.md
   echo "## Coding Standards" >> CONTRIBUTING.md
   echo "- Use 2 spaces for indentation" >> CONTRIBUTING.md
   git add . && git commit -m "Add coding standards section"
   git push
   ```

5. **Approve and merge**
   ```bash
   gh pr review add-contributing-guide --approve
   gh pr merge add-contributing-guide --squash
   ```

6. **Clean up**
   ```bash
   git checkout main
   git pull
   git branch -d add-contributing-guide
   git push origin --delete add-contributing-guide
   ```

### Success Criteria
- [ ] Complete PR lifecycle experienced
- [ ] Review comments added
- [ ] PR merged successfully
- [ ] Branches cleaned up

---

## Review Questions

1. What is the difference between a PR and a branch?
   _______________________________________________

2. When should you use squash merge instead of regular merge?
   _______________________________________________

3. What does `--force-with-lease` do and why use it?
   _______________________________________________

4. How do you update a PR that has conflicts with main?
   _______________________________________________

5. What makes a good PR description?
   _______________________________________________
