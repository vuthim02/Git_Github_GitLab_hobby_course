# Day 35 Exercises: Week 5 Review

## Week 5 Project: Complete GitHub Setup

### Objective
Set up a complete GitHub repository with all Week 5 features.

### Steps

1. **Create repository**
   ```bash
   gh repo create week5-project --public --clone
   cd week5-project
   ```

2. **Create directory structure**
   ```bash
   mkdir -p .github/ISSUE_TEMPLATE .github/workflows
   ```

3. **Create bug template**
   ```bash
   cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
   ---
   name: Bug
   labels: bug
   ---
   ## Description
   ## Steps to reproduce
   ## Expected
   ## Actual
   EOF
   ```

4. **Create CI workflow**
   ```bash
   cat > .github/workflows/ci.yml << 'EOF'
   name: CI
   on: [push, pull_request]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
       - uses: actions/checkout@v4
       - uses: actions/setup-node@v4
         with:
           node-version: '20'
       - run: npm ci
       - run: npm test
   EOF
   ```

5. **Create CODEOWNERS**
   ```bash
   cat > .github/CODEOWNERS << 'EOF'
   * @yourusername
   EOF
   ```

6. **Commit and push**
   ```bash
   git add .
   git commit -m "Complete GitHub setup"
   git push
   ```

7. **Enable protection via web**
   ```
   Settings → Branches → Add rule for main
   - Require reviews
   - Require status checks
   - Include administrators
   ```

### Success Criteria
- [ ] All directories created
- [ ] Issue template works
- [ ] CI workflow runs
- [ ] Branch protected

---

## Review: Answer These Questions

1. What's the difference between Git and GitHub?
2. How do you create a PR?
3. What are status checks?
4. Why protect branches?
5. What does CODEOWNERS do?

---

## Week 5 Complete